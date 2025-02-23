import SwiftUI

struct SleepRoutineView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Newborn sleep can be unpredictable. Here’s what you need to know about your baby’s sleep patterns and how to gently create a routine.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Newborn Sleep Patterns 💤",
                        content: """
                        - Newborns sleep 14-17 hours a day but in short cycles.
                        - They wake up frequently for feeding (every 2-3 hours).
                        - Day-night confusion is normal but improves over time.
                        - Sleep cycles gradually lengthen as they grow.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Creating a Gentle Routine 🌙",
                        content: """
                        - Keep bedtime and wake-up times consistent.
                        - Use dim lights and calm activities before sleep.
                        - Introduce a bedtime routine (bath, lullaby, cuddles).
                        - Encourage naps in a quiet and comfortable space.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Tips for Better Sleep 😴",
                        content: """
                        - Watch for sleepy cues (rubbing eyes, yawning, fussiness).
                        - Avoid overstimulation before bedtime.
                        - Swaddling can help newborns feel secure.
                        - White noise or soft lullabies can create a soothing environment.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Safe Sleep Practices 👶",
                        content: """
                        - Always place your baby on their back to sleep.
                        - Use a firm mattress with no loose blankets or pillows.
                        - Keep the crib free of toys and stuffed animals.
                        - Room-sharing (not bed-sharing) is recommended for the first 6 months.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Sleep & Routine")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    SleepRoutineView()
}
