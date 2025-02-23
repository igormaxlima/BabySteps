import SoundAnalysis
import Combine

class ResultsObserver: NSObject, SNResultsObserving {
    
    private let subject: PassthroughSubject<SNClassificationResult, Error>
    
    init(subject: PassthroughSubject<SNClassificationResult, Error>) {
        self.subject = subject
    }
    
    func request(_ request: any SNRequest, didProduce result: any SNResult) {
        if let result = result as? SNClassificationResult {
            subject.send(result)
        }
    }
    
    func request(_ request: any SNRequest, didFailWithError error: any Error) {
        print("The analysis failed: \(error.localizedDescription)")
        subject.send(completion: .failure(error))
    }
    
    func requestDidComplete(_ request: any SNRequest) {
        print("The request completed successfully!")
        subject.send(completion: .finished)
    }
    
}
