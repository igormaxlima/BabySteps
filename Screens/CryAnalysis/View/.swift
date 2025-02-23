//import SwiftUI
//import SwiftData
//import Charts
//
//struct CryAnalysisView: View {
//    @Query var cryClassifications: [Cry] // Busca os dados armazenados
//    
//    var body: some View {
//        ScrollView {
//            VStack {
//                Text("Cry Analysis")
//                    .font(.largeTitle)
//                    .padding()
//                
//                if cryClassifications.isEmpty {
//                    Text("No cry data available.")
//                        .foregroundStyle(.secondary)
//                } else {
//                    // Gráfico 1: Número de choros por dia da semana
//                    Text("Cries by Day of the Week")
//                        .font(.headline)
//                        .padding(.top)
//                    
//                    Chart {
//                        ForEach(groupByDayOfWeek(cryClassifications), id: \.day) { dayData in
//                            BarMark(
//                                x: .value("Day", dayData.day),
//                                y: .value("Cry Count", dayData.count)
//                            )
//                        }
//                    }
//                    .frame(height: 300)
//                    .padding()
//                    
//                    
//                    // Gráfico 2: Número de choros por hora do dia
//                    Text("Cries by Hour of the Day")
//                        .font(.headline)
//                        .padding(.top)
//                    
//                    Chart {
//                        ForEach(groupByHourOfDay(cryClassifications), id: \.hour) { hourData in
//                            LineMark(
//                                x: .value("Hour", hourData.hour),
//                                y: .value("Cry Count", hourData.count)
//                            )
//                        }
//                    }
//                    .frame(height: 300)
//                    .padding()
//                    
//                    
//                    // Gráfico 3: Número de choros por tipo (Gráfico de Pizza)
//                    Text("Cries by Classification")
//                        .font(.headline)
//                        .padding(.top)
//                    
//                    Chart {
//                        ForEach(groupByCryTypeTotal(cryClassifications), id: \.type) { typeData in
//                            SectorMark(
//                                angle: .value("Cry Count", typeData.count),
//                                innerRadius: 50,
//                                angularInset: 2
//                            )
//                            .foregroundStyle(by: .value("Cry Type", typeData.type))
//                            .annotation(position: .overlay) {
//                                Text("\(typeData.type): \(typeData.count)")
//                                    .font(.caption)
//                                    .foregroundStyle(.white)
//                                    .bold()
//                                    .padding()
//                            }
//                        }
//                    }
//                    .frame(height: 300)
//                    .padding()
//                    
//                }
//            }
//        }
//    }
//    
//    // Helper functions to group data
//    
//    func groupByDayOfWeek(_ cries: [Cry]) -> [(day: String, count: Int)] {
//        let calendar = Calendar.current
//        let daysOfWeek = ["S", "M", "T", "W", "T", "F", "S"]
//        
//        let grouped = Dictionary(grouping: cries) { cry -> String in
//            let weekday = calendar.component(.weekday, from: cry.date)
//            return daysOfWeek[weekday - 1]
//        }
//        
//        return grouped.map { (day: $0.key, count: $0.value.count) }
//            .sorted { $0.day < $1.day }
//    }
//    
//    func groupByHourOfDay(_ cries: [Cry]) -> [(hour: Int, count: Int)] {
//        let calendar = Calendar.current
//        
//        let grouped = Dictionary(grouping: cries) { cry -> Int in
//            return calendar.component(.hour, from: cry.date)
//        }
//        
//        return grouped.map { (hour: $0.key, count: $0.value.count) }
//            .sorted { $0.hour < $1.hour }
//    }
//    
//    func groupByCryTypeTotal(_ cries: [Cry]) -> [(type: String, count: Int)] {
//        let grouped = Dictionary(grouping: cries) { cry in
//            cry.cryType
//        }
//        
//        return grouped.map { (type: $0.key, count: $0.value.count) }
//            .sorted { $0.type < $1.type }
//    }
//}
//
//#Preview {
//    CryAnalysisView()
//}
//
