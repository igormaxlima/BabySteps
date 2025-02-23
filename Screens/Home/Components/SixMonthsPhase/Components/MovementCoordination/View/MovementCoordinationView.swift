import SwiftUI

struct MovementCoordinationView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("As your baby grows, they will start showing new physical milestones like rolling and possibly sitting up. Here’s how to support them.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Rolling Over & Sitting Up 🤸",
                        content: """
                        - Encourage tummy time, which helps strengthen neck and back muscles.
                        - Place your baby on their tummy during the day to practice rolling over.
                        - Once they can roll, assist them in sitting by providing support as they balance.
                        - Avoid rushing the baby—each milestone happens in their own time.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Building Strength 💪",
                        content: """
                        - Encourage activities like reaching for toys, which can help improve muscle coordination.
                        - Gentle exercises like holding their hands and helping them sit up can strengthen their core.
                        - Rolling a ball or gently pushing their legs to practice pushing movements can be fun and beneficial.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Movement Safety ⚠️",
                        content: """
                        - Always supervise your baby during tummy time or any other movement practice.
                        - Make sure the floor is soft and clear of sharp objects when encouraging movement.
                        - Keep the crib and other areas free from obstacles to ensure safe exploration.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Movement & Coordination")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    MovementCoordinationView()
}
