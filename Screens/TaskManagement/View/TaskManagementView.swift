import SwiftUI
import SwiftData

struct TaskManagementView: View {
    @State private var isShowingTaskForm = false
    @Environment(\.modelContext) private var modelContext
    @State private var taskManagementViewModel = TaskManagementViewModel()
    @Query var tasks: [TaskData]
    
    var body: some View {
        NavigationStack {
            VStack {
                
                HeaderView(title: "Activities", subtitle: "Manage and keep track of your daily tasks.")
                
                Divider()
                
                
                if tasks.isEmpty {
                    ContentUnavailableView("No tasks available", systemImage: "exclamationmark.triangle.fill", description: Text("It looks like you haven't set up any tasks yet. Tap the + button to create one."))
                        .padding(.top, 50)
                } else {
                    Label("Tap the circle to mark a task as completed. Swipe left to delete.", systemImage: "questionmark.circle")
                        .font(.headline)
                        .fontWeight(.regular)
                        .foregroundStyle(.gray)
                        .padding(.vertical, 5)
                    
                    List {
                        ForEach(tasks.reversed()) { task in
                            TaskRowView(task: task) {
                                taskManagementViewModel.updateTask(task: task, modelContext: modelContext)
                            }
                            .padding(.vertical, 10)
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.clear)
                            .transition(.move(edge: .top))
                        }
                        .onDelete { indices in
                            let reversedIndex = tasks.count - 1 - indices.first!
                            let taskToDelete = tasks[reversedIndex]
                            taskManagementViewModel.deleteTask(task: taskToDelete, modelContext: modelContext)
                        }
                    }
                    .listStyle(.plain)
                    .scrollIndicators(.hidden)
                    .animation(.easeInOut(duration: 2.0), value: tasks)
                }
            }
            .background(Color("background"))
            .fullScreenCover(isPresented: $isShowingTaskForm) {
                TaskFormView()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isShowingTaskForm.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(Color("pink-secondary"))
                    }
                }
            }
        }
    }
}

#Preview {
    TaskManagementView()
}
