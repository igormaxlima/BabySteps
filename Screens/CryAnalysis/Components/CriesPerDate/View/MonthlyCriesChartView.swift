import SwiftUI
import Charts

struct MonthlyCriesChartView: View {
    let cryAnalysisViewModel: CryAnalysisViewModel
    
    var body: some View {
        Chart(cryAnalysisViewModel.criesByMonth, id: \.day) {
            BarMark(
                x: .value("Month", $0.day, unit: .month),
                y: .value("Cries", $0.cries)
            )
        }
        .chartXAxis {
            AxisMarks(values: .stride(by: .month)) { _ in
                AxisGridLine()
                AxisTick()
                AxisValueLabel(format: .dateTime.month(.abbreviated), centered: true)
            }
        }
    }
}

#Preview {
    VStack{
        MonthlyCriesChartView(cryAnalysisViewModel: .preview)
            .aspectRatio(1, contentMode: .fit)
    }
    .padding()
}
