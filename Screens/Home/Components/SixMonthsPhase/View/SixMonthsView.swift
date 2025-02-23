import SwiftUI

struct SixMonthsView: View {
    
    @State private var selectedCard: typeCard?
    
    let cards: [Card] = [
        Card(color: .green, title: "Starting Solid Foods", description: "How to introduce solids safely and encourage healthy eating habits.", imageName: "food", type: .solidFoods),
        Card(color: .blue, title: "Teething Relief", description: "Tips to ease discomfort as your baby's first teeth come in.", imageName: "teething", type: .teething),
        Card(color: .purple, title: "Social Interaction", description: "Encouraging laughter, playtime, and recognizing familiar faces.", imageName: "social-play", type: .socialInteraction),
        Card(color: .orange, title: "Movement & Coordination", description: "Your baby is rolling and maybe sitting up! How to support this milestone.", imageName: "baby-seated", type: .movement)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Big Milestones Ahead")
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
                
                Text("Your baby is reaching exciting new milestones! From eating solids to social interactions, learn how to support their growth.")
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
                case .solidFoods:
                    SolidFoodsView()
                case .teething:
                    TeethingView()
                case .socialInteraction:
                    SocialInteractionView()
                case .movement:
                    MovementCoordinationView()
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    SixMonthsView()
}
