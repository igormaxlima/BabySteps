import SwiftUI

struct FirstStepsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Encouraging your baby to take their first steps is a huge milestone. Here’s how to support them through crawling and walking.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Encouraging Crawling 🐾",
                        content: """
                        - Provide plenty of tummy time to strengthen the baby's muscles.
                        - Place toys just out of reach to encourage them to crawl.
                        - Support your baby as they reach for things, helping them develop coordination and muscle strength.
                        - Crawling is an essential precursor to walking, so encourage it.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Supporting First Steps 🚶",
                        content: """
                        - Hold your baby's hands as they try to walk.
                        - Encourage walking on soft surfaces first and move to harder floors later.
                        - Use push toys or furniture for your baby to hold onto as they practice standing and walking.
                        - Be patient as it may take time for them to gain the confidence to walk on their own.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Walking Safety ⚠️",
                        content: """
                        - Always keep your baby in a safe environment, free of sharp corners and obstacles.
                        - Use soft mats or carpets to cushion falls.
                        - Make sure your baby wears well-fitting, non-slip shoes when they start walking.
                        - Never leave your baby unattended, especially near stairs or other dangerous areas.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("First Steps")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    FirstStepsView()
}
