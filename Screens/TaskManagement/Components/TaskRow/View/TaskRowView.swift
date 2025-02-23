import SwiftUI

struct TaskRowView: View {
    let task: TaskData
    let onTap: () -> Void
    
    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: task.date)
    }
    
    private var statusColor: Color {
        if task.isDone {
            return .green
        } else if task.date < Date() {
            return .red
        } else {
            return .yellow
        }
    }
    
    private var statusText: String {
        if task.isDone {
            return "Done"
        } else if task.date < Date() {
            return "Expired"
        } else {
            return "Pending"
        }
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Circle()
                .fill(statusColor.opacity(0.8))
                .frame(width: 15, height: 15)
                .onTapGesture {
                    withAnimation(.bouncy) {
                        onTap()
                    }
                }
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image(task.category.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    Text(task.category.title)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 5) {
                            Image(systemName: "clock")
                            Text("\(task.date.formatted(.dateTime.hour().minute()))")
                        }
                        .font(.callout)
                        .foregroundStyle(.black)
                        
                        HStack(spacing: 5) {
                            Image(systemName: "calendar")
                            Text("\(formattedDate)")
                        }
                        .font(.callout)
                        .foregroundStyle(.black)
                    }
                    
                    
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    if let note = task.notes {
                        Text(note)
                            .font(.callout)
                    }
                    
                    Text(statusText)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(statusColor)
                }
                .padding(.top, 10)
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(statusColor.opacity(0.2))
            .clipShape(.rect(cornerRadius: 20))
        }
        .padding(.horizontal, 5)
    }
}

#Preview {
    TaskRowView(task: TaskData(category: .diaperChange, notes: "150ml of milk", date: Date()), onTap: {})
}
