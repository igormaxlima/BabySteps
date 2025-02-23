import SwiftUI

struct FirstExamsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Early health check-ups and screenings are crucial for detecting any health concerns in newborns. Learn which tests and visits are important for your baby’s well-being.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Newborn Screening Tests 🏨",
                        content: """
                        - Heel Prick Test (PKU Test): Detects metabolic disorders.
                        - Hearing Test: Identifies potential hearing loss.
                        - Eye Exam: Checks for vision issues and cataracts.
                        - Blood Tests: Monitor for infections or genetic conditions.
                        """
                    )
                    
                    SectionDetailView(
                        title: "First Pediatric Visit 👶",
                        content: """
                        - Should happen within the first 3 to 5 days after birth.
                        - The doctor will check weight, feeding, and overall health.
                        - Parents can ask questions about newborn care.
                        - Follow-ups are usually scheduled at 1 month, 2 months, and beyond.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Growth & Development 📊",
                        content: """
                        - Regular weight and height checks.
                        - Head circumference monitoring for brain development.
                        - Milestones: first smiles, eye contact, and responses.
                        - Keep a growth chart to track progress.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("First Exams & Check-ups")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    FirstExamsView()
}
