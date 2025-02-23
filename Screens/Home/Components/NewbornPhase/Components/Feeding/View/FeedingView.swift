import SwiftUI

struct FeedingView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Your baby's nutrition in the first days is essential for growth and health. Learn about breastfeeding, formula, and how to ensure proper feeding.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Breastfeeding 🤱",
                        content: """
                        - Breast milk contains all essential nutrients and antibodies.
                        - Feed on demand, typically every 2-3 hours.
                        - Ensure a good latch to avoid pain and improve milk flow.
                        - Skin-to-skin contact helps with bonding and milk production.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Formula Feeding 🍼",
                        content: """
                        - Use only recommended baby formulas.
                        - Prepare according to package instructions (right water-to-powder ratio).
                        - Keep bottles and nipples sterilized to prevent infections.
                        - Watch for signs of allergies (rash, vomiting, diarrhea).
                        """
                    )
                    
                    SectionDetailView(
                        title: "General Feeding Tips 🍽",
                        content: """
                        - Look for hunger cues (sucking hands, moving lips).
                        - Burp your baby after feeding to prevent discomfort.
                        - Keep a feeding schedule but be flexible as needed.
                        - Ensure your baby is gaining weight and producing enough wet diapers.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Nutrition & Hydration for Mom 💧",
                        content: """
                        - Drink plenty of water to stay hydrated.
                        - Eat a balanced diet with protein, calcium, and vitamins.
                        - Avoid excessive caffeine and alcohol.
                        - Rest when possible to support milk production.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Feeding")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    FeedingView()
}
