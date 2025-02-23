import SwiftUI
import SwiftData

struct TaskFormView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var taskManagementViewModel = TaskManagementViewModel()
    @State private var category: TaskType = .breastFeeding
    @State private var date = Date()
    @State private var notes: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section("What type of task are you planning?") {
                        Picker("Category", selection: $category) {
                            ForEach(TaskType.allCases) { category in
                                Text(category.title)
                                    .foregroundStyle(Color("pink-secondary"))
                                    .tag(category)
                            }
                        }
                        .tint(Color("pink-secondary"))
                    }
                    
                    Section("When do you want to complete this task?") {
                        DatePicker("Timeline", selection: $date)
                            .datePickerStyle(.compact)
                            .tint(Color("pink-secondary"))
                    }
                    
                    Section("Share more details about this task (optional)") {
                        TextField("Description", text: $notes)
                    }
                }
                
                Button {
                    let newTask = TaskData(category: category, notes: notes.isEmpty ? nil : notes, date: date)
                    
                    taskManagementViewModel.saveTask(task: newTask, modelContext: modelContext)
                    dismiss()
                } label: {
                    Text("Create Task")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("pink-secondary"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Add New Task")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(Color("pink-secondary"))
                }
            }
        }
    }
}
