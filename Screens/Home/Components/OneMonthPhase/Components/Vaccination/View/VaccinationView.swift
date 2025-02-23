import SwiftUI

struct VaccinationView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Vaccination is crucial for your baby's health, providing protection against serious diseases. Here’s what you need to know about essential vaccines.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Essential Vaccines 💉",
                        content: """
                        - At birth: Hepatitis B.
                        - 2 months: Rotavirus, DTP (Diphtheria, Tetanus, Pertussis), Hib, Polio, Pneumococcal.
                        - 4 months: Second dose of the 2-month vaccines.
                        - 6 months: Third dose of DTP, Polio, and Hepatitis B.
                        - 12 months: MMR (Measles, Mumps, Rubella), Chickenpox, Hepatitis A.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Benefits of Vaccination ✔️",
                        content: """
                        - Protects against life-threatening diseases.
                        - Helps prevent outbreaks in the community.
                        - Boosts immunity safely and effectively.
                        - Reduces the risk of severe complications.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Common Side Effects ⚠️",
                        content: """
                        - Mild fever or slight swelling at the injection site.
                        - Fussiness or sleepiness for a day.
                        - In rare cases, allergic reactions (seek medical help if severe).
                        - Applying a cold compress can ease discomfort.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Vaccination")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    VaccinationView()
}
