import SwiftUI

struct CardView: View {
    let card: Card
    let onTap: () -> Void
    
    var body: some View {
        HStack(spacing: 15) {
            Image(card.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(10)
            
            
            VStack(alignment: .leading, spacing: 2) {
                Text("\(card.title)")
                    .font(.headline)
                    .foregroundStyle(Color(.white))
                
                if let description = card.description {
                    Text("\(description)")
                        .font(.subheadline)
                        .foregroundStyle(Color(.white))
                }
            }
            
            Spacer()
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(card.color)
        }
        .onTapGesture {
            onTap()
        }
        .padding(.horizontal)
    }
}

#Preview {
    CardView(card: .MOCK_CARD, onTap: { })
}
