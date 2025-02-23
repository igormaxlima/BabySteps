import SwiftUI

struct HomeView: View {
    @State private var selectedPhase: Phase = .pregnancy
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Hello, how’s your parenting journey going?")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 2)
                
                Text("Choose your baby’s current stage to get helpful tips and insights.")
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundStyle(.secondary)
            }
            
            ScrollViewReader { scrollView in
                ScrollView(.horizontal, showsIndicators: false) {
                    ZStack {
                        Rectangle()
                            .fill(Color("phase_not_selected").opacity(0.5))
                            .frame(height: 4)
                            .offset(y: -10)
                            .padding(.horizontal, 40)
                        
                        LazyHStack(spacing: 50) {
                            ForEach(Phase.allCases) { phase in
                                Button(action: {
                                    withAnimation {
                                        selectedPhase = phase
                                    }
                                }) {
                                    VStack(spacing: 10) {
                                        Circle()
                                            .fill(selectedPhase == phase ? Color("phase_selected").opacity(0.9) : Color("phase_not_selected").opacity(0.9))
                                            .frame(width: 80, height: 80)
                                            .overlay(
                                                Image(phase.imageName)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .padding()
                                            )
                                        
                                        Text(phase.rawValue)
                                            .font(.footnote)
                                            .fontWeight(selectedPhase == phase ? .semibold : .regular)
                                            .foregroundColor(selectedPhase == phase ? Color("pink-secondary") : .gray.opacity(0.8))
                                    }
                                }
                                .frame(minWidth: 60)
                                .id(phase)
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                }
                .frame(maxHeight: 160)
                .onChange(of: selectedPhase) {
                    withAnimation {
                        scrollView.scrollTo(selectedPhase, anchor: .center)
                    }
                }
            }
            
            Divider()
                .padding(.horizontal)
            
            VStack {
                Group {
                    switch selectedPhase {
                    case .pregnancy:
                        PregnancyView()
                    case .newborn:
                        NewbornView()
                    case .oneMonth:
                        OneMonthView()
                    case .threeMonths:
                        ThreeMonthsView()
                    case .sixMonths:
                        SixMonthsView()
                    case .oneYear:
                        OneYearView()
                    }
                }
                .transition(.blurReplace)
            }
            .animation(.easeInOut, value: selectedPhase)
            
            Spacer()
        }
        .background(Color("background"))
    }
}

#Preview {
    HomeView()
}
