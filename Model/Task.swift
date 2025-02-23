import SwiftData
import Foundation

enum TaskType: String, Codable, CaseIterable, Identifiable {
    case breastFeeding
    case bottleFeeding
    case diaperChange
    case sleep
    case walking
    case medicalAppointment
    
    var title: String {
        switch self {
        case .breastFeeding: return "Breastfeeding"
        case .bottleFeeding: return "Bottle Feeding"
        case .diaperChange: return "Diaper Change"
        case .sleep: return "Sleep"
        case .walking: return "Walking"
        case .medicalAppointment: return "Medical Appointment"
        }
    }
    
    var image: String {
        switch self {
        case .breastFeeding: return "breastfeeding_icon"
        case .bottleFeeding: return "bottlefeeding_icon"
        case .diaperChange: return "diaper_icon"
        case .sleep: return "sleep_icon"
        case .walking: return "walking_icon"
        case .medicalAppointment: return "medical_icon"
        }
    }
    
    var id: Self { self }
}
@Model
class TaskData {
    var id: UUID
    var category: TaskType
    var notes: String?
    var date: Date
    var isDone: Bool
    
    init(id: UUID = .init(), category: TaskType, notes: String? = nil, date: Date, isDone: Bool = false) {
        self.id = id
        self.category = category
        self.notes = notes
        self.date = date
        self.isDone = isDone
    }
}

