import SwiftUI
import SwiftData

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .background(Color("background"))
                .preferredColorScheme(.light)
                .modelContainer(for: [Cry.self, TaskData.self])
        }
    }
}
