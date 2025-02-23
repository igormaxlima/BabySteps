import SwiftUI

struct BabyEssentialsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Preparing for your baby's arrival? Here’s a checklist of must-have items to make sure you have everything you need.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Newborn Essentials 🍼👶",
                        content: """
                        - 6-8 bodysuits and sleepers.
                        - Newborn diapers and wipes.
                        - Baby-safe laundry detergent.
                        - Soft blankets for swaddling.
                        - Gentle baby shampoo and soap.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Sleep Essentials 🛏️",
                        content: """
                        - A safe crib with a firm mattress.
                        - Baby monitor for peace of mind.
                        - Soft, breathable fitted sheets.
                        - Swaddle blankets or sleep sacks.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Travel & Outings 🚗🚼",
                        content: """
                        - Infant car seat (rear-facing).
                        - Stroller for easy mobility.
                        - Baby carrier or wrap.
                        - Diaper bag stocked with essentials.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Mom's Postpartum Care 🤱",
                        content: """
                        - Nursing bras and breast pads.
                        - Comfortable clothes for recovery.
                        - Nipple cream for breastfeeding comfort.
                        - Water bottle to stay hydrated.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Baby Essentials")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}


#Preview {
    BabyEssentialsView()
}
