import SwiftUI

struct SleepTransitionView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("As your baby transitions from multiple daytime naps to longer nighttime sleep, creating a consistent sleep routine is key for better rest.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Signs of Readiness for the Transition 💤",
                        content: """
                        - Your baby starts skipping one of their daytime naps.
                        - They seem less fussy and more relaxed in the evenings.
                        - Your baby is able to stay awake for longer periods without becoming overtired.
                        - They begin to have longer stretches of sleep at night.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Creating a Nighttime Routine 🌛",
                        content: """
                        - Keep bedtime consistent each night.
                        - Create a calming pre-sleep routine, such as a warm bath, a bedtime story, and soft lullabies.
                        - Ensure that the room is dark, quiet, and at a comfortable temperature.
                        - Use a consistent sleep environment that will signal it’s time to sleep.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Tips for Better Sleep Quality 🛏️",
                        content: """
                        - Avoid stimulating activities before bedtime (e.g., no screen time or rough play).
                        - Watch for your baby’s sleep cues and try to start the bedtime routine before they become overtired.
                        - Swaddling or using a sleep sack can help babies feel secure and cozy.
                        - Offer a comfort object (like a soft toy) that can help your baby self-soothe.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Sleep Transition")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    SleepTransitionView()
}
