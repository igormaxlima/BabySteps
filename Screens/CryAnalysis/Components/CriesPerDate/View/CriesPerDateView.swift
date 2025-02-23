import SwiftUI
import Charts

enum TimeIntervalChart: String, CaseIterable, Identifiable {
    case day = "Day"
    case week = "Week"
    case month = "Month"
    var id: Self { self }
}

struct CriesPerDateView: View {
    let cryAnalysisViewModel: CryAnalysisViewModel
    @State private var selectedTimeIntervalChart = TimeIntervalChart.day
    
    var body: some View {
        VStack(alignment: .leading) {
            Picker(selection: $selectedTimeIntervalChart.animation()) {
                ForEach(TimeIntervalChart.allCases) { interval in
                    Text(interval.rawValue)
                }
            } label: {
                Text("Time interval")
            }
            .pickerStyle(.segmented)
            
            Group {
                Text("Your baby had ") +
                Text("\(cryAnalysisViewModel.cryData.count) cries").bold().foregroundColor(Color.accentColor) +
                Text(" over the last 90 days.")
            }.padding(.vertical)
            
            Group {
                switch selectedTimeIntervalChart {
                case .day:
                    DailyCriesChartView(cryAnalysisViewModel: cryAnalysisViewModel)
                case .week:
                    WeeklyCriesChartView(cryAnalysisViewModel: cryAnalysisViewModel)
                case .month:
                    MonthlyCriesChartView(cryAnalysisViewModel: cryAnalysisViewModel)
                        .aspectRatio(1, contentMode: .fit)
                }
            }
            .aspectRatio(0.8, contentMode: .fit)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CriesPerDateView(cryAnalysisViewModel: .preview)
}
