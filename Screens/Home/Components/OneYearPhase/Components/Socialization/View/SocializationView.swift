import SwiftUI

struct SocializationView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Encouraging group play and interaction with other children can boost your baby’s social development and help them form meaningful relationships.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Benefits of Socialization 🌱",
                        content: """
                        - Helps develop communication skills and emotional intelligence.
                        - Promotes sharing, turn-taking, and empathy.
                        - Enhances cognitive abilities by learning from peers.
                        - Builds trust and comfort in group settings.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Encouraging Group Play 🤝",
                        content: """
                        - Arrange playdates with children around your baby’s age.
                        - Visit parks or community centers where babies can interact with others.
                        - Play simple games together, such as peekaboo or passing a ball.
                        - Encourage sharing toys and taking turns during playtime.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Challenges and How to Overcome Them ⚖️",
                        content: """
                        - If your baby is shy, start with one-on-one interactions and gradually introduce more children.
                        - Support your baby if they feel overwhelmed by social situations.
                        - Encourage positive reinforcement, praising social behaviors like sharing or communicating.
                        - Be patient; social skills develop over time.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Socialization")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    SocializationView()
}
