import SwiftUI

struct TeethingView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Teething can be a challenging time for both you and your baby. Here's how to make it easier and more comfortable.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Teething Symptoms 😬",
                        content: """
                        - Increased drooling.
                        - Chewing on objects.
                        - Irritability or fussiness.
                        - Swollen or tender gums.
                        - Trouble sleeping or eating.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Teething Relief Tips 🍼",
                        content: """
                        - Offer chilled teething rings or cold washcloths for your baby to chew on.
                        - Gently massage your baby’s gums with a clean finger.
                        - Use over-the-counter teething gels or pain relievers (consult with your pediatrician).
                        - Distraction with toys or soft music can help soothe your baby.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Caring for Baby's Teeth 🪥",
                        content: """
                        - Wipe your baby's gums with a clean, damp cloth even before teeth appear.
                        - Start brushing with a soft baby toothbrush once the first tooth appears.
                        - Avoid sugary foods and drinks that can contribute to tooth decay.
                        - Schedule your baby's first dental visit by their first birthday.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Teething Relief")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    TeethingView()
}
