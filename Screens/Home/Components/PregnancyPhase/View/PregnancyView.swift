import SwiftUI

struct PregnancyView: View {
    
    @State private var selectedCard: typeCard?
    
    let cards: [Card] = [
        Card(color: .green, title: "Health & Nutrition", description: "Discover safe exercises and the best foods for a healthy pregnancy.", imageName: "salad", type: .health),
        Card(color: .pink.opacity(0.6), title: "Emotional Well-being", description: "Understand mood changes, stress management, and how to bond with your baby before birth", imageName: "mental-health", type: .emotionalWellBeing),
        Card(color: .purple, title: "Baby Essentials", description: "What do you really need before your baby arrives? A checklist of must-have items.", imageName: "shop", type: .babyEssentials),
        Card(color: .yellow, title: "Partner Involvement", description: "How your partner can support you during pregnancy", imageName: "partner-involvement", type: .partnerInvolvement)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparing for Your Baby’s Arrival")
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
                
                Text("Your baby is growing rapidly! Learn what to expect in each trimester and how to prepare.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 15) {
                    ForEach(cards) { card in
                        CardView(card: card, onTap: { selectedCard = card.type })
                    }
                }
                
                Spacer()
            }
            .padding(.top, 10)
            .fullScreenCover(item: $selectedCard) { card in
                switch card {
                case .health:
                    HealthNutritionDetailsView()
                case .emotionalWellBeing:
                    EmotionalWellBeingView()
                case .babyEssentials:
                    BabyEssentialsView()
                case .partnerInvolvement:
                    PartnerInvolvementView()
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    PregnancyView()
}
