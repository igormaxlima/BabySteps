import SwiftUI

struct FacialExpressionsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Your baby is starting to smile and recognize faces! This is an important step in social development and bonding.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "What to Expect in This Phase 🍼",
                        content: """
                        - First social smiles appear around 6-8 weeks.
                        - Babies start imitating facial expressions.
                        - They respond to familiar faces with excitement.
                        - Eye contact and cooing become more common.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Encouraging Social Interaction 👶",
                        content: """
                        - Make eye contact and smile often.
                        - Talk to your baby using different tones and expressions.
                        - Play simple games like peek-a-boo.
                        - Show exaggerated happy expressions to encourage mimicry.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Benefits of Facial Expressions ❤️",
                        content: """
                        - Strengthens emotional bonding with caregivers.
                        - Helps develop communication skills.
                        - Encourages early social interactions.
                        - Builds trust and a sense of security.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Facial Expressions")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    FacialExpressionsView()
}
