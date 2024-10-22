//
//  ContentView.swift
//  whatIDOs
//
//  Created by Natalia Nikiforuk on 20/10/2024.
//

import SwiftUI

struct Task: Identifiable {
    var id = UUID()
    var title: String
    var completed: Bool
}

struct ContentView: View {
    @State private var tasks: [Task] = [
        Task(title: "Dishes", completed: false),
        Task(title: "Homework", completed: false)
    ]
    @State private var inputValue = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("whatIDOs")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .foregroundColor(.mint)
                    Spacer()
                    Button {
                        deleteAllTasks()
                    } label: {
                        Text("Delete all")
                    }
                    .padding(.vertical, 20)
                }
                .foregroundColor(.gray)
                HStack {
                    TextField("New task...", text: $inputValue)
                        .autocorrectionDisabled()
                        .textFieldStyle(.roundedBorder)
                        .shadow(
                            color: .gray,
                            radius: CGFloat(0.8))
                    Button {
                        addNewTask()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .bold()
                    }
                    .background(.yellow)
                    .cornerRadius(10)
                    .shadow(
                        color: .gray,
                        radius: CGFloat(0.8))
                }
                .padding(.vertical, 20)
                if tasks.count == 0 {
                    Text("Currently no task")
                        .foregroundColor(.gray)
                } else {
                    ForEach(tasks) { task in
                        HStack {
                            Text(task.title)
                                .strikethrough(task.completed == true, color: .red)
                            Spacer()
                            HStack {
                                Button {
                                    deleteTask(id: task.id)
                                } label: {
                                    Image(systemName: "trash")
                                }
                                .padding(.horizontal, 20)
                                Button {
                                    completeTask(id: task.id)
                                } label: {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                    .padding()
                    .background(.mint)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .bold()
                }
            }
            .padding()
            Spacer()
        }
    }
    
    func deleteTask(id: UUID ) {
        tasks.removeAll() { $0.id == id }
    }
    
    func deleteAllTasks() {
        tasks.removeAll()
    }
    
    func addNewTask() {
        tasks.append(Task(title: inputValue, completed: false))
        inputValue = ""
    }
    
    func completeTask(id: UUID){
        if let completedTaskID = tasks.firstIndex(where: {$0.id == id}) {
            tasks[completedTaskID].completed.toggle()
        }
    }
}


#Preview {
    ContentView()
}


