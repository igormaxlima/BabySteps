import SwiftUI
import Charts

enum ChartStyle: String, CaseIterable, Identifiable {
    case pie = "Pie Chart"
    case bar = "Bar Chart"
    
    var id: Self { self }
}

struct CryPerCategoryView: View {
    let cryAnalysisViewModel: CryAnalysisViewModel
    @State private var selectedChartStyle: ChartStyle = .pie
    
    var body: some View {
        VStack {
            Picker("Chart Type", selection: $selectedChartStyle) {
                ForEach(ChartStyle.allCases) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.bottom)
            
            if let mostFrequentCryType = cryAnalysisViewModel.mostFrequentCryType {
                Text("Your most frequent cry category is ") +
                Text("\(mostFrequentCryType.cryType)").bold().foregroundColor(Color.accentColor) +
                Text(" with ") +
                Text("\(mostFrequentCryType.cries)").bold() +
                Text(" cries.")
            }
            
            switch selectedChartStyle {
            case .pie:
                CryPerCategoryPieChartView(cryAnalysisViewModel: cryAnalysisViewModel)
                    .padding(.top)
            case .bar:
                CryPerCategoryBarChartView(cryAnalysisViewModel: cryAnalysisViewModel)
                    .padding(.top)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CryPerCategoryView(cryAnalysisViewModel: .preview)
}
