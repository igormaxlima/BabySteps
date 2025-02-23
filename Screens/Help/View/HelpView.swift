import SwiftUI

struct HelpView: View {
    let confidentialSupportNumber = "tel://+351912301010"
    
    var body: some View {
        VStack {
            
            HeaderView(title: "Need Support?", subtitle: "Help is Available")
            
            Divider()
            
            ScrollView(showsIndicators: false) {
                Image("support-call")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.5)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("- Apoio à Vida is an organization that offers psychological, social, legal, and medical guidance for women facing pregnancies.")
                    
                    Text("- They provide a confidential 24-hour support line where you can speak to someone, ask questions, and explore different options.")
                }
                .font(.body)
                .foregroundColor(.secondary)
                .padding(15)
                
                Divider()
                    .padding(.horizontal)
                
                VStack(spacing: 20) {
                    VStack {
                        Text("24/7 Confidential Support:")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text("+351 912 30 10 10")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color("pink-secondary"))
                    }
                    
                    VStack {
                        Text("WhatsApp Support")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text("(Weekdays, 9AM to 5PM):")
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text("+351 911 011 480")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color("pink-secondary"))
                    }
                }
                .padding(.vertical, 10)
                
                VStack {
                    Button(action: {
                        if let url = URL(string: confidentialSupportNumber) {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("Call Now")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("pink-secondary"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(10)
                }
            }
        }
        .background(Color("background"))
    }
}

#Preview {
    HelpView()
}
