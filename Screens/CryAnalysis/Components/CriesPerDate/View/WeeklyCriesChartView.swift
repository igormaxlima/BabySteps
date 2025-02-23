import SwiftUI
import Charts

struct WeeklyCriesChartView: View {
    let cryAnalysisViewModel: CryAnalysisViewModel
    @State private var rawSelectedDate: Date? = nil
    @Environment(\.calendar) var calendar
    
    var selectedDateValue: (day: Date, cries: Int)? {
        if let rawSelectedDate {
            return cryAnalysisViewModel.criesByWeek.first(where: {
                let startOfWeek = $0.day
                let endOfWeek = endOfWeek(for: startOfWeek) ?? Date()
                return (startOfWeek ... endOfWeek).contains(rawSelectedDate)
            })
        }
        return nil
    }
    
    var body: some View {
        Chart(cryAnalysisViewModel.criesByWeek, id: \.day) {
            BarMark(
                x: .value("Week", $0.day, unit: .weekOfYear),
                y: .value("Cries", $0.cries)
            )
            .opacity(selectedDateValue == nil || $0.day == selectedDateValue?.day ? 1 : 0.5)
            
            if let rawSelectedDate {
                RuleMark(x: .value("Selected", rawSelectedDate, unit: .day))
                    .foregroundStyle(Color.gray.opacity(0.3))
                    .offset(yStart: -10)
                    .zIndex(-1)
                    .annotation(
                        position: .top,
                        spacing: 0,
                        overflowResolution: .init(
                            x: .fit(to: .chart),
                            y: .disabled
                        )
                    ) {
                        selectionPopover
                    }
            }
        }
        .chartXSelection(value: $rawSelectedDate)
    }
    
    func endOfWeek(for startOfWeek: Date) -> Date? {
        calendar.date(byAdding: .day, value: 6, to: startOfWeek)
    }
    
    func beginingOfWeek(for date: Date) -> Date? {
        calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date))
    }
    
    @ViewBuilder
    var selectionPopover: some View {
        if let selectedDateValue {
            VStack {
                Text(selectedDateValue.day.formatted(.dateTime.month().day()))
                Text("\(selectedDateValue.cries) cries")
                    .bold()
                    .foregroundStyle(Color("pink-secondary"))
            }
            .padding(6)
            .background {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.white)
                    .shadow(color: Color("pink-secondary"), radius: 2)
            }
        }
    }
}


#Preview {
    WeeklyCriesChartView(cryAnalysisViewModel: .preview)
        .aspectRatio(1, contentMode: .fit)
        .padding()
}
