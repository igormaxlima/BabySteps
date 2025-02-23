import SwiftUI

struct HandCoordinationView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Your baby is learning to grasp objects! Developing hand-eye coordination is a crucial step in motor skills and cognitive growth.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Developmental Milestones 👶",
                        content: """
                        - At around 2 months, babies start reaching for objects.
                        - By 3-4 months, they begin to grasp with their whole hand.
                        - By 6 months, they can transfer objects between hands.
                        - By 9-12 months, they start using the pincer grasp (thumb and forefinger).
                        """
                    )
                    
                    SectionDetailView(
                        title: "How to Stimulate Hand-Eye Coordination 🎾",
                        content: """
                        - Offer colorful and lightweight toys for grabbing.
                        - Use rattles to encourage reaching and grasping.
                        - Play “catch and release” games with soft objects.
                        - Let your baby explore different textures and shapes.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Best Toys for Hand Coordination 🧸",
                        content: """
                        - Soft rattles and teething rings.
                        - Sensory balls with different textures.
                        - Activity gyms with hanging toys.
                        - Stacking cups and soft blocks.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Hand Coordination")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    HandCoordinationView()
}
