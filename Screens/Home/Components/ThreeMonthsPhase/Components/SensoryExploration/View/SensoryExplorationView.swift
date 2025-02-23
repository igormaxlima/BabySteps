import SwiftUI

struct SensoryExplorationView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Sensory exploration is key to your baby's cognitive development. Engaging their senses helps them understand the world and build important skills.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Benefits of Sensory Play 🧠",
                        content: """
                        - Enhances cognitive and motor skills.
                        - Develops problem-solving abilities.
                        - Encourages curiosity and exploration.
                        - Strengthens neural connections in the brain.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Recommended Toys 🧸",
                        content: """
                        - Soft textured balls to stimulate touch.
                        - High-contrast black and white cards for visual focus.
                        - Rattles and musical toys to develop auditory skills.
                        - Water play mats for interactive exploration.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Sensory Activities 🎭",
                        content: """
                        - Let your baby feel different textures (smooth, rough, soft).
                        - Play peek-a-boo with fabric to develop object permanence.
                        - Introduce gentle scents like lavender or vanilla.
                        - Use water play to explore temperature and movement.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Sensory Exploration")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    SensoryExplorationView()
}
