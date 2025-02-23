import Observation
import SwiftData
import SwiftUI
import SoundAnalysis
import Combine
import AVFoundation

enum SystemAudioClassificationError: Error {
    case noMicrophoneAccess
}

@Observable
class SoundDetectionViewModel {
    
    @ObservationIgnored
    let soundAnalysisManager = SoundAnalysisManager.shared
    
    @ObservationIgnored
    var lastTime: Double = 0
    
    var detectionStarted = false
    var identifiedSound: (identifier: String, confidence: String)?
    private var detectionCancellable: AnyCancellable? = nil
    
    var showErrorAlert = false
    var errorMessage = ""
    
    func checkMicrophonePermission() throws {
        var microphonePermissionGranted = false
        
        switch AVCaptureDevice.authorizationStatus(for: .audio) {
        case .notDetermined:
            let sem = DispatchSemaphore(value: 0)
            AVCaptureDevice.requestAccess(for: .audio) { success in
                microphonePermissionGranted = success
                sem.signal()
            }
            _ = sem.wait(timeout: DispatchTime.distantFuture)
        case .denied, .restricted:
            break
        case .authorized:
            microphonePermissionGranted = true
        @unknown default:
            fatalError("unknown authorization status for microphone access")
            
        }
        
        if !microphonePermissionGranted {
            throw SystemAudioClassificationError.noMicrophoneAccess
        }
    }
    
    private func formattedDetectionResult(_ result: SNClassificationResult) -> (identifier: String, confidence: String)? {
        guard let classification = result.classifications.first else { return nil }
        
        if lastTime == 0 {
            lastTime = result.timeRange.start.seconds
        }
        
        let formattedTime = String(format: "%.2f", result.timeRange.start.seconds - lastTime)
        print("Analysis result for audio at time: \(formattedTime)")
        
        let displayName = classification.identifier.replacingOccurrences(of: "_", with: " ").capitalized
        let confidence = classification.confidence
        let confidencePercentString = String(format: "%.2f%%", confidence  * 100.0)
        print("\(displayName): \(confidencePercentString) confidence.\n")
        
        return (displayName, confidencePercentString)
    }
    
    @MainActor
    func startDetection(modelContext: ModelContext) {
        Task {
            await startSoundClassification(modelContext: modelContext)
        }
    }
    
    private func startSoundClassification(modelContext: ModelContext) async {
        let classificationSubject = PassthroughSubject<SNClassificationResult, Error>()
        
        detectionCancellable = classificationSubject
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in self.detectionStarted = false }, receiveValue: { result in
                self.identifiedSound = self.formattedDetectionResult(result)
                
                if let sound = self.identifiedSound, sound.identifier != "Background" {
                    self.saveCryClassification(modelContext: modelContext, identifier: sound.identifier)
                }
                
                if self.identifiedSound != nil {
                    self.stopDetection()
                }
            })
        
        await soundAnalysisManager.startSoundClassification(subject: classificationSubject)
    }
    
    
    func stopDetection() {
        lastTime = 0
        self.detectionStarted = false
        soundAnalysisManager.stopSoundClassification()
    }
    
    private func saveCryClassification(modelContext: ModelContext, identifier: String) {
        let cryEvent = Cry(date: Date(), cryType: identifier)
        modelContext.insert(cryEvent)
        
        do {
            try modelContext.save()
        } catch {
            print("Erro ao salvar o choro classificado: \(error.localizedDescription)")
        }
    }
    
    
    func handleError(_ error: Error) {
        if let classificationError = error as? SystemAudioClassificationError {
            switch classificationError {
            case .noMicrophoneAccess:
                errorMessage = "Microphone access is required to classify sounds. Please enable it in Settings."
            }
        } else {
            errorMessage = "An unknown error occurred. Please try again."
        }
        
        showErrorAlert = true
    }
}
