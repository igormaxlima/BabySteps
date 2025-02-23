import SwiftUI
import Charts

struct CryPerCategoryPieChartView: View {
    let cryAnalysisViewModel: CryAnalysisViewModel
    
    var body: some View {
        Chart(cryAnalysisViewModel.totalCriesPerType.sorted(by: { $0.cries < $1.cries}), id: \.cryType) { data in
            SectorMark(
                angle: .value("Cries", data.cries),
                innerRadius: .ratio(0.618),
                angularInset: 4
            )
            .cornerRadius(8.0)
            .foregroundStyle(by: .value("Cry Type", data.cryType))
            .opacity(data.cryType == cryAnalysisViewModel.mostFrequentCryType?.cryType ? 1 : 0.3)
        }
        .chartLegend(alignment: .center, spacing: 18)
        .aspectRatio(1, contentMode: .fit)
        
        .chartBackground { chartProxy in
            GeometryReader { geometry in
                let frame = geometry[chartProxy.plotFrame!]
                
                if let mostFrequentCryType = cryAnalysisViewModel.mostFrequentCryType {
                    VStack {
                        Text(mostFrequentCryType.cryType)
                            .font(.title2.bold())
                            .foregroundColor(.primary)
                        Text(mostFrequentCryType.cries.formatted() + " cries")
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundStyle(.secondary)
                    }
                    .position(x: frame.midX, y: frame.midY)
                }
            }
        }
        
    }
}

#Preview {
    CryPerCategoryPieChartView(cryAnalysisViewModel: .preview)
}

