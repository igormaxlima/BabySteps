import SwiftUI

struct IntroducingWorldView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Your baby is ready to explore the world! Safe outdoor experiences and social interactions help with cognitive and emotional development.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "First Outdoor Experiences 🚶‍♂️",
                        content: """
                        - Short walks in the stroller or baby carrier are great introductions.
                        - Choose calm environments like parks or quiet streets.
                        - Observe your baby’s reactions and adapt outings accordingly.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Outdoor Safety Tips ☀️",
                        content: """
                        - Use a hat and baby-safe sunscreen for sun protection.
                        - Avoid crowded places and harsh weather conditions.
                        - Dress appropriately for the temperature.
                        - Ensure the stroller or carrier provides good support.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Encouraging Social Interactions 😊",
                        content: """
                        - Introduce family members and friends gradually.
                        - Let your baby observe social interactions before engaging.
                        - Use gentle touch and eye contact to reassure them.
                        - Encourage playdates with other babies when ready.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Introducing the World")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    IntroducingWorldView()
}
