import SwiftUI

struct MotorDevelopmentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Your baby’s motor skills develop rapidly in the first year. Learn about natural reflexes, first movements, and how to support healthy development.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Newborn Reflexes 👶",
                        content: """
                        - Moro Reflex: Sudden movements make baby stretch arms.
                        - Rooting Reflex: Baby turns head toward touch (helps with feeding).
                        - Palmar Grasp: Baby grasps fingers placed in their hands.
                        - Stepping Reflex: If held upright, baby makes stepping motions.
                        """
                    )
                    
                    SectionDetailView(
                        title: "First Movements 🚼",
                        content: """
                        - 0-3 months: Lifting head, moving arms and legs.
                        - 4-6 months: Rolling over, pushing up on arms.
                        - 7-9 months: Sitting without support, reaching for objects.
                        - 10-12 months: Pulling to stand, crawling, taking first steps.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Encouraging Development 🎾",
                        content: """
                        - Tummy Time: Helps strengthen neck and shoulders.
                        - Interactive Play: Rattles, mirrors, and textured toys.
                        - Safe Space to Explore: Allow baby to move freely.
                        - Cheering and Encouragement: Positive reinforcement matters!
                        """
                    )
                    
                    SectionDetailView(
                        title: "When to Consult a Doctor ❗",
                        content: """
                        - Baby does not respond to loud sounds.
                        - Lack of head control by 3 months.
                        - Not rolling over by 6 months.
                        - Not attempting to stand or crawl by 12 months.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Motor Development")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    MotorDevelopmentView()
}
