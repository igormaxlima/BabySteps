import SwiftUI

struct SolidFoodsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Introducing solid foods to your baby is an exciting milestone. Here’s how to do it safely while encouraging healthy eating habits.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "When to Start Solids ⏰",
                        content: """
                        - Most babies are ready around 6 months old.
                        - Signs of readiness include good head control and interest in food.
                        - Always consult with your pediatrician before starting solids.
                        """
                    )
                    
                    SectionDetailView(
                        title: "First Solid Foods 🥄",
                        content: """
                        - Start with single-ingredient purees (e.g., rice cereal, apples, or carrots).
                        - Introduce one new food at a time and wait a few days to watch for allergies.
                        - Gradually increase texture as your baby becomes accustomed to solids.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Healthy Eating Habits 🥦",
                        content: """
                        - Encourage a variety of fruits, vegetables, and whole grains.
                        - Let your baby explore and self-feed when ready (baby-led weaning).
                        - Make mealtimes enjoyable and relaxed to create positive associations.
                        - Be patient – it may take time for your baby to accept new foods.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Starting Solid Foods")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    SolidFoodsView()
}
