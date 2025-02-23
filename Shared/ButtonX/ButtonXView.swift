import SwiftUI

struct ButtonXView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .foregroundColor(.white)
                .padding(8)
                .background(Color("pink-secondary").opacity(0.6))
                .clipShape(Circle())
        }
    }
}

#Preview {
    ButtonXView()
}
