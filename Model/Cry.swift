import SwiftData
import Foundation

@Model
class Cry {
    var date: Date
    var cryType: String
    
    init(date: Date, cryType: String) {
        self.date = date
        self.cryType = cryType
    }
}

extension Cry {
    static var MOCK_DATA: [Cry] {
        let cryTypes = ["Tired", "Burping", "Hungry", "Belly Pain", "Discomfort"]
        var mockData: [Cry] = []
        
        let calendar = Calendar.current
        let now = Date()
        
        for _ in 0..<100 {
            let randomDaysAgo = Int.random(in: 0...90)
            let randomHoursAgo = Int.random(in: 0...23)
            let randomMinutesAgo = Int.random(in: 0...59)
            
            let randomDate = calendar.date(
                byAdding: .day,
                value: -randomDaysAgo,
                to: now
            ) ?? now
            let randomTime = calendar.date(
                byAdding: .hour,
                value: -randomHoursAgo,
                to: randomDate
            ) ?? randomDate
            let finalDate = calendar.date(
                byAdding: .minute,
                value: -randomMinutesAgo,
                to: randomTime
            ) ?? randomTime
            
            let randomCryType = cryTypes.randomElement() ?? "Discomfort"
            
            let mockCry = Cry(date: finalDate, cryType: randomCryType)
            mockData.append(mockCry)
        }
        return mockData
    }
}
