import SwiftUI

struct ThreeMonthsView: View {
    
    @State private var selectedCard: typeCard?
    
    let cards: [Card] = [
        Card(color: .purple, title: "Sensory Exploration", description: "Discover the best toys and activities for cognitive development.", imageName: "sensory-play", type: .sensoryExploration),
        Card(color: .pink.opacity(0.7), title: "Facial Expressions", description: "Your baby is smiling and reacting to faces! Learn how to encourage social interactions.", imageName: "baby-smile", type: .facialExpressions),
        Card(color: .orange, title: "Hand Coordination", description: "Your baby starts grasping objects! How to stimulate hand-eye coordination.", imageName: "baby-hands", type: .handCoordination),
        Card(color: .blue, title: "Introducing the World", description: "How to make safe outdoor experiences and social interactions enjoyable.", imageName: "baby-outdoors", type: .introducingWorld)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Watching Your Baby Grow")
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
                
                Text("At this stage, your baby is engaging more with the world! Here’s how to support their development and make the most of their growing curiosity.")
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
                case .sensoryExploration:
                    SensoryExplorationView()
                case .facialExpressions:
                    FacialExpressionsView()
                case .handCoordination:
                    HandCoordinationView()
                case .introducingWorld:
                    IntroducingWorldView()
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    ThreeMonthsView()
}
