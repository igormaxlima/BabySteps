import SwiftUI
import SwiftData
import Charts

struct CryAnalysisView: View {
    @Query var cryClassifications: [Cry]
    @Environment(\.modelContext) private var modelContext
    @State private var cryAnalysisViewModel: CryAnalysisViewModel = CryAnalysisViewModel(cryData: [])
    @State private var showConfirmationDialog = false
    
    var body: some View {
        VStack {
            
            HeaderView(title: "Cry Stats Dashboard", subtitle: "Insights into your baby's cry patterns with detailed charts and valuable data.")
            
            Divider()
            
            if cryClassifications.isEmpty {
                ContentUnavailableView(
                    "No Cry Classifications",
                    systemImage: "chart.line.downtrend.xyaxis",
                    description: Text("You haven't classified any cries yet. Use the Cry Classifier to start classifying and analyzing your baby's cries!")
                )
            } else {
                ScrollView {
                    CryPerCategoryView(cryAnalysisViewModel: cryAnalysisViewModel)
                    
                    Divider()
                        .padding()
                    
                    CriesPerWeekdayView(cryAnalysisViewModel: cryAnalysisViewModel)
                    
                    Divider()
                        .padding()
                    
                    CriesPerDateView(cryAnalysisViewModel: cryAnalysisViewModel)
                    
                    Divider()
                    
                    Button(action: {
                        showConfirmationDialog = true
                    }) {
                        Text("Reset Data")
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
                .padding(5)
                .scrollIndicators(.hidden)
            }
        }
        .background(Color("background"))
        .onAppear {
            cryAnalysisViewModel = CryAnalysisViewModel(cryData: cryClassifications)
        }
        .navigationTitle("Your baby cries stats")
        .confirmationDialog(
            "Are you sure you want to delete all cry data?",
            isPresented: $showConfirmationDialog,
            titleVisibility: .visible
        ) {
            Button("Delete All", role: .destructive) {
                cryAnalysisViewModel.resetData(modelContext: modelContext)
            }
            Button("Cancel", role: .cancel) {}
        }
    }
    
}

#Preview {
    CryAnalysisView()
}

