import SwiftUI

struct SpeechCommunicationView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Speech and communication development is a journey that begins with sounds and evolves into words. Here’s how to encourage your baby’s language skills.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Encouraging Sounds & First Words 🗣️",
                        content: """
                        - Respond to your baby's cooing and babbling to encourage communication.
                        - Repeat sounds and words back to them, reinforcing what they say.
                        - Engage in face-to-face interactions to help your baby focus on mouth movements.
                        - Read to your baby daily, even if they can’t understand the words yet.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Stimulating Language Skills 🗨️",
                        content: """
                        - Talk to your baby throughout the day, describing actions, objects, and feelings.
                        - Use simple words and phrases, and pause to give your baby time to respond.
                        - Sing songs and nursery rhymes to help them develop rhythm and sound awareness.
                        - Encourage play with toys that involve sounds, such as musical toys or talking dolls.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Understanding Non-Verbal Communication 🧠",
                        content: """
                        - Pay attention to your baby’s gestures, such as reaching out or pointing.
                        - Be mindful of facial expressions, as they are often their first way of communicating.
                        - Respond to their non-verbal cues to let them know you understand.
                        - Use sign language or simple gestures to encourage their communication.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Speech & Communication")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    SpeechCommunicationView()
}
