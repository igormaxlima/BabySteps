import SwiftUI

struct BondingStimulationView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Bonding with your baby is essential for emotional and cognitive development. Learn how skin-to-skin contact, music, and talking can boost your baby’s growth.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Skin-to-Skin Contact 🤱",
                        content: """
                        - Helps regulate baby’s temperature and heartbeat.
                        - Reduces stress and improves sleep.
                        - Strengthens the emotional bond between parent and baby.
                        - Supports breastfeeding success.
                        """
                    )
                    
                    SectionDetailView(
                        title: "The Power of Music & Talking 🎵🗣",
                        content: """
                        - Babies recognize parents’ voices from birth.
                        - Gentle music can soothe and promote brain development.
                        - Talking to your baby helps language skills early on.
                        - Singing lullabies strengthens emotional connection.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Play & Stimulation 🎾👐",
                        content: """
                        - Use high-contrast toys for visual development.
                        - Tummy time strengthens neck and shoulder muscles.
                        - Gentle massages promote relaxation and bonding.
                        - Face-to-face interaction helps baby learn expressions.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Bonding & Stimulation")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    BondingStimulationView()
}
