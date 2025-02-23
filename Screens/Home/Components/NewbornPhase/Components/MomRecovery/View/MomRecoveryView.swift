import SwiftUI

struct MomRecoveryView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Postpartum recovery is a journey that requires physical and emotional care. Learn how to heal, manage baby blues, and find the support you need.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Physical Recovery 🩹",
                        content: """
                        - Rest as much as possible, especially in the first weeks.
                        - Stay hydrated and eat nutrient-rich foods to promote healing.
                        - For vaginal delivery: manage perineal pain with ice packs and warm baths.
                        - For C-section: avoid heavy lifting and follow wound care instructions.
                        - Light walking can help with circulation and recovery.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Baby Blues & Mental Health 💙",
                        content: """
                        - It's normal to feel emotional shifts due to hormonal changes.
                        - Baby blues usually last a few weeks, but if sadness persists, talk to a doctor.
                        - Seek emotional support from loved ones or professional help if needed.
                        - Don't hesitate to ask for help—you're not alone in this journey.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Sleep & Rest 😴",
                        content: """
                        - Sleep when the baby sleeps to regain energy.
                        - Accept help from family and friends for household tasks.
                        - Try short naps during the day if nighttime sleep is interrupted.
                        - Avoid excessive caffeine, as it may affect your rest.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Support System ❤️",
                        content: """
                        - Partners, family, and friends can help with baby care and chores.
                        - Join postpartum support groups for shared experiences.
                        - Talking about your feelings helps reduce stress and anxiety.
                        - If needed, seek guidance from a therapist or counselor.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Mom’s Recovery")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    MomRecoveryView()
}
