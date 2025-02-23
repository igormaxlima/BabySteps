import SwiftData
import Foundation

@Observable
class CryAnalysisViewModel {
    
    var cryData: [Cry]
    
    var criesByDay: [(day: Date, cries: Int)] {
        let criesByDay = criesGroupedByDay(cries: cryData)
        return totalCriesPerDate(criesByDate: criesByDay)
    }
    
    var criesByWeek:[(day: Date, cries: Int)] {
        let criesByWeek = criesGroupedByWeek(cries: cryData)
        return totalCriesPerDate(criesByDate: criesByWeek)
    }
    
    var criesByMonth: [(day: Date, cries: Int)] {
        let criesByMonth = criesGroupedByMonth(cries: cryData)
        return totalCriesPerDate(criesByDate: criesByMonth)
    }
    
    var totalCriesByWeekday: [(number: Int, cries: Int)] {
        let criesByWeekday = criesGroupedByWeekday(cries: cryData)
        
        return criesByWeekday.map { (number: $0.key, cries: $0.value.count) }
            .sorted { $0.number < $1.number }
    }
    
    var highestCriesWeekday: (number: Int, cries: Int)? {
        totalCriesByWeekday.max(by: { $0.cries < $1.cries })
    }
    
    var averageCriesPerWeekday: Double {
        let totalCries = totalCriesByWeekday.reduce(0) { $0 + $1.cries }
        let totalDays = totalCriesByWeekday.count
        return totalDays > 0 ? Double(totalCries) / Double(totalDays) : 0.0
    }
    
    var totalCriesPerType: [(cryType: String, cries: Int)] {
        let criesByType = criesGroupedByType(cries: cryData)
        return totalCriesPerType(criesByType: criesByType)
    }
    
    var mostFrequentCryType: (cryType: String, cries: Int)? {
        let sortedCryTypes = totalCriesPerType.sorted(by: { $0.cries == $1.cries ? $0.cryType < $1.cryType : $0.cries > $1.cries})
        
        return sortedCryTypes.first
    }
    
    init(cryData: [Cry]) {
        self.cryData = cryData
    }
    
    func criesGroupedByDay(cries: [Cry]) -> [Date: [Cry]] {
        var criesByDay: [Date: [Cry]] = [:]
        
        let calendar = Calendar.current
        for cry in cries {
            let date = calendar.startOfDay(for: cry.date)
            if criesByDay[date] != nil {
                criesByDay[date]!.append(cry)
            } else {
                criesByDay[date] = [cry]
            }
        }
        
        return criesByDay
    }
    
    func totalCriesPerDate(criesByDate: [Date: [Cry]]) -> [(day: Date, cries: Int)] {
        var totalCries: [(day: Date, cries: Int)] = []
        
        for (date, cries) in criesByDate {
            let totalCriesForDate = cries.count
            totalCries.append((day: date, cries: totalCriesForDate))
        }
        
        return totalCries
    }
    
    func criesGroupedByWeek(cries: [Cry]) -> [Date: [Cry]] {
        var criesByWeek: [Date: [Cry]] = [:]
        
        let calendar = Calendar.current
        for cry in cries {
            guard let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: cry.date)) else { continue }
            if criesByWeek[startOfWeek] != nil {
                criesByWeek[startOfWeek]!.append(cry)
            } else {
                criesByWeek[startOfWeek] = [cry]
            }
        }
        
        return criesByWeek
    }
    
    func criesGroupedByMonth(cries: [Cry]) -> [Date: [Cry]] {
        var criesByMonth: [Date: [Cry]] = [:]
        
        let calendar = Calendar.current
        for cry in cries {
            guard let startOfMonth = calendar.date(from: calendar.dateComponents([.month], from: cry.date)) else { continue }
            if criesByMonth[startOfMonth] != nil {
                criesByMonth[startOfMonth]!.append(cry)
            } else {
                criesByMonth[startOfMonth] = [cry]
            }
        }
        
        return criesByMonth
    }
    
    func criesGroupedByWeekday(cries: [Cry]) -> [Int: [Cry]] {
        var criesByWeekday: [Int: [Cry]] = [:]
        
        let calendar = Calendar.current
        for cry in cries {
            let weekday = calendar.component(.weekday, from: cry.date)
            if criesByWeekday[weekday] != nil {
                criesByWeekday[weekday]!.append(cry)
            } else {
                criesByWeekday[weekday] = [cry]
            }
        }
        
        return criesByWeekday
    }
    
    func averageCriesPerNumber(criesByNumber: [Int: [Cry]]) -> [(number: Int, cries: Double)] {
        var averageCries: [(number: Int, cries: Double)] = []
        
        for (number, cries) in criesByNumber {
            let count = cries.count
            let totalCriesForWeekday = cries.count
            averageCries.append((number: number, cries: Double(totalCriesForWeekday) / Double(count)))
        }
        
        return averageCries
    }
    
    func criesGroupedByType(cries: [Cry]) -> [String: [Cry]] {
        var criesByType: [String: [Cry]] = [:]
        
        for cry in cries {
            let cryType = cry.cryType
            if criesByType[cryType] != nil {
                criesByType[cryType]!.append(cry)
            } else {
                criesByType[cryType] = [cry]
            }
        }
        
        return criesByType
    }
    
    func totalCriesPerType(criesByType: [String: [Cry]]) -> [(cryType: String, cries: Int)] {
        var totalCries: [(cryType: String, cries: Int)] = []
        
        for (cryType, cries) in criesByType {
            let totalCriesForType = cries.count
            totalCries.append((cryType: cryType, cries: totalCriesForType))
        }
        
        return totalCries
    }
    
    func resetData(modelContext: ModelContext) {
        for cry in cryData {
            modelContext.delete(cry)
        }
        
        do {
            try modelContext.save()
            self.cryData = []
        } catch {
            print("Failed to delete cry data: \(error)")
        }
        
    }
    
    static var preview: CryAnalysisViewModel {
        let vm = CryAnalysisViewModel(cryData: Cry.MOCK_DATA)
        return vm
    }
}
