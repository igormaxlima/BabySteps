import SwiftUI

struct OneMonthView: View {
    
    @State private var selectedCard: typeCard?
    
    let cards: [Card] = [
        Card(color: .purple.opacity(0.7), title: "Motor Development", description: "Learn about your baby’s natural reflexes and first movements.", imageName: "motor-development", type: .motorDevelopment),
        Card(color: .pink.opacity(0.6), title: "Bonding & Stimulation", description: "Skin-to-skin contact, music, and talking to your baby to boost development.", imageName: "bonding", type: .bondingStimulation),
        Card(color: .green, title: "Vaccination", description: "Essential vaccines for your baby at this stage.", imageName: "vaccine", type: .vaccination)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Adjusting to a New Routine")
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
                
                Text("Your baby is growing and adapting to the world! Here’s what to expect in this stage and how to support their development.")
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
                case .motorDevelopment:
                    MotorDevelopmentView()
                case .bondingStimulation:
                    BondingStimulationView()
                case .vaccination:
                    VaccinationView()
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    OneMonthView()
}
