import Foundation
import SwiftData

@Observable
class TaskManagementViewModel {
    func saveTask(task: TaskData, modelContext: ModelContext) {
        modelContext.insert(task)
        try? modelContext.save()
    }
    
    func updateTask(task: TaskData, modelContext: ModelContext) {
        task.isDone.toggle()
        try? modelContext.save()
    }
    
    func deleteTask(task: TaskData, modelContext: ModelContext) {
        modelContext.delete(task)
        try? modelContext.save()
    }
}
