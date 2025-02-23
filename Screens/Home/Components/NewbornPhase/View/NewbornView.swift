import SwiftUI

struct NewbornView: View {
    
    @State private var selectedCard: typeCard?
    
    let cards: [Card] = [
        Card(color: .blue, title: "Sleep & Routine", description: "Learn what to expect about your newborn’s sleep and how to create a gentle routine.", imageName: "sleep", type: .sleepRoutine),
        Card(color: .orange, title: "Feeding", description: "Breastfeeding, formula, and the importance of proper nutrition in the first days.", imageName: "feeding", type: .feeding),
        Card(color: .purple.opacity(0.7), title: "Baby Care", description: "How to bathe, change diapers, and take care of your newborn’s umbilical cord.", imageName: "baby-care", type: .babyCare),
        Card(color: .pink.opacity(0.6), title: "Mom’s Recovery", description: "Postpartum recovery, baby blues, and mental health support.", imageName: "mother-care", type: .momRecovery),
        Card(color: .green, title: "First Exams", description: "Important health check-ups and pediatric visits for your newborn.", imageName: "medical-check", type: .firstExams)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Welcome to Parenthood")
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
                
                Text("The first month with your newborn is full of changes and discoveries. Here’s what you need to know to navigate this stage.")
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
                case .sleepRoutine:
                    SleepRoutineView()
                case .feeding:
                    FeedingView()
                case .babyCare:
                    BabyCareView()
                case .momRecovery:
                    MomRecoveryView()
                case .firstExams:
                    FirstExamsView()
                default:
                    EmptyView()
                }
            }
            
        }
    }
}


#Preview {
    NewbornView()
}
