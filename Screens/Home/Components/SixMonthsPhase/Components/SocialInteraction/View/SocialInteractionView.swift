import SwiftUI

struct SocialInteractionView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Encouraging social interaction helps boost your baby’s cognitive and emotional development. Here's how to engage your little one.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Encouraging Laughter 😂",
                        content: """
                        - Play peek-a-boo or other face-to-face games.
                        - Make funny faces or sounds to elicit a giggle.
                        - Respond to your baby’s coos and sounds with laughter to encourage interaction.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Playtime Ideas 🧸",
                        content: """
                        - Interactive toys like rattles, soft dolls, and musical instruments.
                        - Gentle tickling and physical play such as rolling on the floor.
                        - Sing songs with simple hand motions or finger plays.
                        - Engage in sensory play, such as textures, colors, and sounds.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Recognizing Familiar Faces 👶",
                        content: """
                        - Hold your baby in front of familiar faces and say their name to help recognition.
                        - Encourage grandparents, siblings, and other family members to spend time with the baby.
                        - Babies can usually recognize their caregivers' faces by around 2-3 months.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Social Interaction")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    SocialInteractionView()
}
