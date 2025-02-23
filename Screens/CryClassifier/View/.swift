//
//  CryDetectionViewModel.swift
//  BabySteps
//
//  Created by Igor Max de Lima Nunes on 20/01/25.
//

import Foundation
import Combine
import AVFAudio
import SoundAnalysis

// MARK: - ViewModel
class CryDetectionViewModel: ObservableObject {
    @Published var resultText: String = "Press Record to Start"
    @Published var isRecording: Bool = false
    
    private var audioEngine: AVAudioEngine!
    private var streamAnalyzer: SNAudioStreamAnalyzer!
    private var cancellables = Set<AnyCancellable>()
    
    private let bufferSize: UInt32 = 8192
    private let duration: Double = 5.0 // 5 seconds
    
    func startDetection() {
        resultText = "Recording..."
        isRecording = true
        
        // Prepare audio engine
        audioEngine = AVAudioEngine()
        let inputNode = audioEngine.inputNode
        let inputFormat = inputNode.inputFormat(forBus: 0)
        streamAnalyzer = SNAudioStreamAnalyzer(format: inputFormat)
        
        // Create the model and request
        do {
            // -- Request with custom Sound Classifier.
            let soundClassifier = try InfantCryClassifier(configuration: MLModelConfiguration())
            let model = soundClassifier.model
            let request = try SNClassifySoundRequest(mlModel: model)
            
            // Create observer
            let observer = ResultsObserver { [weak self] result in
                self?.processResult(result)
            }
            
            // Add request to analyzer
            try streamAnalyzer.add(request, withObserver: observer)
        } catch {
            resultText = "Error initializing sound analysis: \(error.localizedDescription)"
            isRecording = false
            return
        }
        
        // Install tap to capture audio
        inputNode.installTap(onBus: 0, bufferSize: bufferSize, format: inputFormat) { [weak self] buffer, time in
            self?.streamAnalyzer.analyze(buffer, atAudioFramePosition: time.sampleTime)
        }
        
        // Start the audio engine
        do {
            try audioEngine.start()
        } catch {
            resultText = "Error starting audio engine: \(error.localizedDescription)"
            isRecording = false
            return
        }
        
        stopDetection()
    }
    
    func stopDetection() {
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        streamAnalyzer.removeAllRequests()
        
        isRecording = false
        if resultText == "Recording..." {
            resultText = "No result detected."
        }
    }
    
    private func processResult(_ result: SNClassificationResult) {
        guard let classification = result.classifications.first else {
            resultText = "No result detected."
            return
        }
        
        let confidence = String(format: "%.2f%%", classification.confidence * 100)
        resultText = "Detected: \(classification.identifier)\nConfidence: \(confidence)"
    }
}
