import SwiftUI

struct OneYearView: View {
    
    @State private var selectedCard: typeCard?
    
    let cards: [Card] = [
        Card(color: .green, title: "First Steps", description: "Encouraging crawling and walking. How to support your baby as they start moving.", imageName: "first-steps", type: .firstSteps),
        Card(color: .blue, title: "Speech & Communication", description: "First words and sounds. Learn how to stimulate your baby’s language skills.", imageName: "baby-speech", type: .speechCommunication),
        Card(color: .orange, title: "Independent Eating", description: "Encouraging self-feeding and helping your baby eat on their own.", imageName: "baby-cutlery", type: .independentEating),
        Card(color: .purple, title: "Sleep Transition", description: "Transitioning from multiple naps to longer nighttime sleep. Tips for better sleep routines.", imageName: "baby-sleep", type: .sleepTransition),
        Card(color: .pink, title: "Socialization", description: "Encouraging group play and interaction with other children. Supporting your baby’s social development.", imageName: "baby-socializing", type: .socialization)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Your Baby is Becoming a Toddler")
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
                
                Text("At one year old, your baby is hitting exciting milestones like walking, talking, and playing with other kids. Learn how to support these changes.")
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
                case .firstSteps:
                    FirstStepsView()
                case .speechCommunication:
                    SpeechCommunicationView()
                case .independentEating:
                    IndependentEatingView()
                case .sleepTransition:
                    SleepTransitionView()
                case .socialization:
                    SocializationView()
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    OneYearView()
}
