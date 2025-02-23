import SwiftUI

struct SectionDetailView: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .foregroundColor(Color("pink-secondary"))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(content)
                .font(.body)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SectionDetailView(title: "Creating a Gentle Routine 🌙",
                      content: """
                      - Keep bedtime and wake-up times consistent.
                      - Use dim lights and calm activities before sleep.
                      - Introduce a bedtime routine (bath, lullaby, cuddles).
                      - Encourage naps in a quiet and comfortable space.
                      """)
}
