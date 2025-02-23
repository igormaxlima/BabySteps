import SwiftUI

struct HealthNutritionDetailsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Maintaining a balanced diet and safe exercise routine is crucial for a healthy pregnancy. Learn what foods to eat, exercises to do, and how to stay hydrated.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    SectionDetailView(
                        title: "Healthy Eating 🍎",
                        content: """
                        - Eat protein-rich foods like lean meat, beans, and eggs.
                        - Increase intake of calcium (milk, yogurt, cheese).
                        - Include iron-rich foods (spinach, lentils, lean red meat).
                        - Consume omega-3 for brain development (salmon, chia seeds).
                        - Avoid high-mercury fish, raw seafood, and processed foods.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Safe Exercises 🏋️‍♀️",
                        content: """
                        - Walking is a great low-impact exercise.
                        - Try prenatal yoga to improve flexibility and reduce stress.
                        - Swimming helps relieve joint pressure.
                        - Avoid high-impact sports and heavy weightlifting.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Stay Hydrated 💧",
                        content: """
                        - Drink at least 8-10 glasses of water daily.
                        - Avoid sugary and caffeinated drinks.
                        - Coconut water is a great natural electrolyte source.
                        """
                    )
                    
                    SectionDetailView(
                        title: "Consult Your Doctor 🏥",
                        content: """
                        - Always consult a doctor before starting a new workout.
                        - Stop exercising if you feel dizzy, have pain, or shortness of breath.
                        - A nutritionist can help create a personalized meal plan.
                        """
                    )
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Health & Nutrition")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ButtonXView()
                }
            }
        }
    }
}

#Preview {
    HealthNutritionDetailsView()
}
