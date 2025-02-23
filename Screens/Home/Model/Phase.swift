import Foundation

enum Phase: String, CaseIterable, Identifiable {
    case pregnancy = "Pregnancy"
    case newborn = "Newborn"
    case oneMonth = "1 month"
    case threeMonths = "3 months"
    case sixMonths = "6 months"
    case oneYear = "1 year"
    
    var id: Self { self }
    
    var imageName: String {
        switch self {
        case .pregnancy: return "pregnancy_image"
        case .newborn: return "newborn_image"
        case .oneMonth: return "one_month_image"
        case .threeMonths: return "three_months_image"
        case .sixMonths: return "six_months_image"
        case .oneYear: return "one_year_image"
        }
    }
}
