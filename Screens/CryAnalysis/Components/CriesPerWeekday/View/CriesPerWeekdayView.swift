import SwiftUI
import Charts

struct CriesPerWeekdayView: View {
    let cryAnalysisViewModel: CryAnalysisViewModel
    @State private var averageCriesIsShown: Bool = true
    
    var body: some View {
        VStack(alignment: .leading) {
            if let highestCriesWeekday = cryAnalysisViewModel.highestCriesWeekday {
                Text("Your highest cries day of the week is ") +
                Text("\(longWeekday(for: highestCriesWeekday.number))").bold().foregroundColor(Color.accentColor) +
                Text(" with an average of ") +
                Text("\(Int(highestCriesWeekday.cries)) cries per day.").bold()
            }
            
            Chart {
                ForEach(cryAnalysisViewModel.totalCriesByWeekday, id: \.number) { data in
                    BarMark(x: .value("Day", weekday(for: data.number)),
                            y: .value("Cries", data.cries))
                    .foregroundStyle(.gray.opacity(0.2))
                    .annotation(position: .top) {
                        Text("\(Int(data.cries))")
                            .font(.caption)
                            .foregroundColor(.black)
                            .bold()
                    }
                }
                
                if averageCriesIsShown {
                    let average = cryAnalysisViewModel.averageCriesPerWeekday
                    RuleMark(
                        y: .value("Average", Double(average))
                    )
                    .foregroundStyle(Color("pink-secondary"))
                    .lineStyle(StrokeStyle(lineWidth: 3))
                    .annotation(position: .trailing) {
                        Text("\(Int(average))")
                            .font(.caption)
                            .foregroundColor(Color("pink-secondary"))
                            .bold()
                    }
                }
            }
            .frame(height: 300)
            
            Toggle("Show Average Cries", isOn: $averageCriesIsShown)
        }
        .padding()
    }
    
    let formatter = DateFormatter()
    
    func weekday(for number: Int) -> String {
        formatter.shortWeekdaySymbols[number - 1]
    }
    
    func longWeekday(for number: Int) -> String {
        formatter.weekdaySymbols[number - 1]
    }
}

#Preview {
    CriesPerWeekdayView(cryAnalysisViewModel: .preview)
}
