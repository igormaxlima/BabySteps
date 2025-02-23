import SwiftUI

struct EmotionalWellBeingView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Pregnancy is a time of emotional changes. Learn how to manage mood swings, reduce stress, and bond with your baby before birth.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Mood Swings 😃😢",
                        content: """
                        - Hormonal changes can cause emotional ups and downs.
                        - Get enough rest and maintain a balanced diet.
                        - Engage in activities that bring you joy, like reading or walking.
                        - Communicate openly with your partner and loved ones.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Managing Stress 🧘‍♀️",
                        content: """
                        - Practice deep breathing and meditation.
                        - Try prenatal yoga for relaxation and mental clarity.
                        - Spend time with supportive family and friends.
                        - Reduce work pressure and take time for yourself.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Bonding with Your Baby 🤰💞",
                        content: """
                        - Talk or sing to your baby daily.
                        - Play soft music to create a calm environment.
                        - Gently massage your belly to feel connected.
                        - Visualize happy moments with your baby.
                        """
                    )
                    
                    SectionDetailView(
                        title: "When to Seek Help? 🏥",
                        content: """
                        - If you feel persistently sad or anxious.
                        - If you experience extreme fatigue and lack motivation.
                        - If mood changes are affecting daily life.
                        - Talking to a professional can make a big difference.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Emotional Well-being")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    EmotionalWellBeingView()
}
