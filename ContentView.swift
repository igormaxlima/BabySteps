import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 2
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HelpView()
                .tag(0)
                .tabItem {
                    Label("Support", systemImage: "phone")
                }
            
            TaskManagementView()
                .tag(1)
                .tabItem {
                    Label("Tasks", systemImage: "checklist")
                }
            
            HomeView()
                .tag(2)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            CryClassifierView()
                .tag(3)
                .tabItem {
                    Label("Baby Monitor", systemImage: "waveform.badge.microphone")
                }
            
            CryAnalysisView()
                .tag(4)
                .tabItem {
                    Label("Insights", systemImage: "chart.bar.xaxis")
                }
            
        }
        .padding()
        .accentColor(Color("pink-secondary"))
    }
}

#Preview {
    ContentView()
}

