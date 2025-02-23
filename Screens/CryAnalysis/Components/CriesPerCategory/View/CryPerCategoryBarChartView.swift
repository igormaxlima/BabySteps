import SwiftUI
import Charts

struct CryPerCategoryBarChartView: View {
    let cryAnalysisViewModel: CryAnalysisViewModel
    
    var body: some View {
        Chart(cryAnalysisViewModel.totalCriesPerType, id: \.cryType) { data in
            BarMark(x: .value("Cries", data.cries),
                    y: .value("Cry Type", data.cryType))
            .annotation(position: .trailing, alignment: .leading, content: {
                Text(String(data.cries))
                    .opacity(data.cryType == cryAnalysisViewModel.mostFrequentCryType?.cryType ? 1 : 0.5)
            })
            .foregroundStyle(by: .value("Cry Type", data.cryType))
            .opacity(data.cryType == cryAnalysisViewModel.mostFrequentCryType?.cryType ? 1 : 0.5)
        }
        .chartLegend(.hidden)
        .frame(minHeight: 400)
    }
}

#Preview {
    CryPerCategoryBarChartView(cryAnalysisViewModel: .preview)
        .padding()
}

