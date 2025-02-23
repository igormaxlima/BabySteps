import SwiftUI

struct IndependentEatingView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Encouraging self-feeding helps your baby develop motor skills and independence. Here's how to support your baby as they learn to eat on their own.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Starting Independent Eating 🍴",
                        content: """
                        - Introduce soft, easy-to-grip foods like small pieces of fruit, toast, or cooked vegetables.
                        - Allow your baby to explore food with their hands before using utensils.
                        - Offer a spoon or fork, but let your baby guide their own eating.
                        - Be patient and let them learn at their own pace, making mealtimes fun and engaging.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Strategies for Encouraging Independence 🧸",
                        content: """
                        - Provide a safe and comfortable eating environment (e.g., high chair or booster seat).
                        - Encourage your baby to feed themselves during every meal, even if it's messy.
                        - Allow your baby to take breaks and avoid rushing them.
                        - Praise their attempts to eat on their own, reinforcing their efforts.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Safe Eating & Motor Development 🍼",
                        content: """
                        - Make sure the food is cut into small, manageable pieces to prevent choking.
                        - Introduce utensils that are easy for your baby to grip.
                        - Encourage hand-eye coordination by letting your baby practice scooping or picking up food.
                        - Be mindful of your baby’s developmental stage and adjust foods accordingly.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Independent Eating")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    IndependentEatingView()
}
