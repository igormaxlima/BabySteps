@preconcurrency import SoundAnalysis
import Combine

final class SoundAnalysisManager: NSObject {
    private let bufferSize = 8192
    
    private var audioEngine: AVAudioEngine?
    private var inputBus: AVAudioNodeBus?
    private var inputFormat: AVAudioFormat?
    
    private var streamAnalyzer: SNAudioStreamAnalyzer?
    
    private let analysisQueue = DispatchQueue(label: "com.igormaxdev.AnalysisQueue")
    
    private var retainedObserver: SNResultsObserving?
    private var subject: PassthroughSubject<SNClassificationResult, Error>?
    
    nonisolated(unsafe) static let shared = SoundAnalysisManager()
    
    private override init() {}
    
    func configureAudioSession() {
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.record, mode: .default, options: [])
            try session.setActive(true)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    func setupAudioEngine() {
        configureAudioSession()
        audioEngine = AVAudioEngine()
        let inputBus = AVAudioNodeBus(0)
        self.inputBus = inputBus
        inputFormat = audioEngine?.inputNode.inputFormat(forBus: inputBus)
    }
    
    func startAnalysis(_ requestAndObserver: (request: SNRequest, observer: SNResultsObserving)) async throws {
        setupAudioEngine()
        
        guard let audioEngine = audioEngine, let inputBus = inputBus, let inputFormat = inputFormat else { return }
        
        let streamAnalyzer = SNAudioStreamAnalyzer(format: inputFormat)
        self.streamAnalyzer = streamAnalyzer
        
        try streamAnalyzer.add(requestAndObserver.request, withObserver: requestAndObserver.observer)
        retainedObserver = requestAndObserver.observer
        
        self.audioEngine?.inputNode.installTap(
            onBus: inputBus,
            bufferSize: UInt32(bufferSize),
            format: inputFormat
        ) { [weak self] buffer, time in
            guard let self = self, let streamAnalyzer = self.streamAnalyzer else { return }
            self.analysisQueue.async {
                streamAnalyzer.analyze(buffer, atAudioFramePosition: time.sampleTime)
            }
        }
        
        do {
            try audioEngine.start()
        } catch {
            print("Unable to start AVAudioEngine: \(error.localizedDescription)")
        }
    }
    
    func startSoundClassification(subject: PassthroughSubject<SNClassificationResult, Error>, inferenmceWindowSize: Double? = nil, overlapFactor: Double? = nil) async {
        do {
            let observer = ResultsObserver(subject: subject)
            
            let soundClassifier = try InfantCryClassifier(configuration: MLModelConfiguration())
            let model = soundClassifier.model
            let request = try SNClassifySoundRequest(mlModel: model)
            
            if let inferenmceWindowSize = inferenmceWindowSize {
                request.windowDuration = CMTimeMakeWithSeconds(inferenmceWindowSize, preferredTimescale: 48_000)
            }
            if let overlapFactor = overlapFactor {
                request.overlapFactor = overlapFactor
            }
            
            self.subject = subject
            try await startAnalysis((request, observer))
        } catch {
            print("Unable to prepare request with Sound Classifier: \(error.localizedDescription)")
            subject.send(completion: .failure(error))
            self.subject = nil
        }
    }
    
    func stopSoundClassification() {
        autoreleasepool {
            if let audioEngine = audioEngine {
                audioEngine.stop()
                audioEngine.inputNode.removeTap(onBus: 0)
            }
            if let streamAnalyzer = streamAnalyzer {
                streamAnalyzer.removeAllRequests()
            }
            streamAnalyzer = nil
            retainedObserver = nil
            audioEngine = nil
        }
    }
}
