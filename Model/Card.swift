import Foundation
import SwiftUICore

enum typeCard: Identifiable {
    case health, emotionalWellBeing, babyEssentials, partnerInvolvement
    case sleepRoutine, feeding, babyCare, momRecovery, firstExams
    case motorDevelopment, bondingStimulation, vaccination
    case sensoryExploration, facialExpressions, handCoordination, introducingWorld
    case solidFoods, teething, socialInteraction, movement
    case firstSteps, speechCommunication, independentEating, sleepTransition, socialization
    
    var id: Self { self }
}

struct Card: Identifiable {
    let id = UUID()
    let color: Color
    let title: String
    let description: String?
    let imageName: String
    let type: typeCard
}

extension Card {
    static var MOCK_CARD: Card {
        return Card(
            color: .green,
            title: "Health & Nutrition",
            description: "Discover safe exercises and the best foods for a healthy pregnancy",
            imageName: "salad",
            type: .health
        )
    }
}
