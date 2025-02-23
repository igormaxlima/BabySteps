import SwiftUI

struct BabyCareView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Newborn care is essential for a healthy start. Learn how to bathe, change diapers, and take care of your baby's umbilical cord safely.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Bathing Your Baby 🛁",
                        content: """
                        - Use lukewarm water (around 37°C or 98°F).
                        - Support your baby's head and neck at all times.
                        - Use a soft washcloth and mild baby soap.
                        - Keep the bath short (5-10 minutes) to avoid getting cold.
                        - Pat dry and apply moisturizer to prevent dry skin.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Diaper Changing 🧷",
                        content: """
                        - Change diapers frequently to prevent rashes.
                        - Wipe front to back for hygiene, especially for girls.
                        - Apply diaper cream if there's redness.
                        - Ensure the diaper is snug but not too tight.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Umbilical Cord Care 🌿",
                        content: """
                        - Keep the area clean and dry.
                        - Avoid covering the stump with the diaper (fold the diaper down).
                        - Do not pull or try to remove it; it will fall off naturally in 1-2 weeks.
                        - Contact a doctor if you notice redness, bad odor, or pus.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Baby Care")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    BabyCareView()
}
