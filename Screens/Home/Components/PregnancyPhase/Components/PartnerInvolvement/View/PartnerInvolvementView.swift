import SwiftUI

struct PartnerInvolvementView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("A strong support system during pregnancy makes a huge difference. Here’s how partners can be more involved and provide meaningful support.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Emotional Support ❤️",
                        content: """
                        - Listen and validate feelings without judgment.
                        - Encourage open communication about fears and concerns.
                        - Offer reassurance and patience during mood swings.
                        - Help manage stress through relaxation techniques.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Preparing for the Baby 🍼",
                        content: """
                        - Set up the nursery together.
                        - Research baby essentials and parenting tips.
                        - Attend childbirth and parenting classes.
                        - Discuss parenting roles and responsibilities.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Attending Medical Appointments 🏥",
                        content: """
                        - Be present at ultrasound scans and check-ups.
                        - Learn about pregnancy symptoms and stages.
                        - Ask questions and take notes for future reference.
                        - Support decisions regarding birth plans and medical care.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Everyday Involvement 👶",
                        content: """
                        - Help with household chores to reduce stress.
                        - Give gentle massages for relaxation.
                        - Encourage healthy eating and hydration.
                        - Celebrate milestones and small victories together.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Partner Involvement")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}


#Preview {
    PartnerInvolvementView()
}
