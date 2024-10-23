//
//  ContentView.swift
//  whatIDOs
//
//  Created by Natalia Nikiforuk on 20/10/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \Task.id, order: .reverse) var tasks: [Task]
    @Environment(\.modelContext) private var context
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
                        //                        deleteAllTasks()
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
                if tasks.isEmpty {
                    Text("Currently no task")
                        .foregroundColor(.gray)
                } else {
                    ForEach(tasks) {task in
                        HStack {
                            Text(task.title)
                                .strikethrough(task.completed == true, color: .red)
                            Spacer()
                            HStack {
                                Button {
                                    //                                    completeTask(id: task.id)
                                } label: {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                    .onDelete(perform: deleteTask)
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
    
    func deleteTask(_ indexSet: IndexSet) {
        for index in indexSet {
            let task = tasks[index]
            context.delete(task)
        }
    }
    
    //    func deleteAllTasks() {
    //        tasks.removeAll()
    //    }
    
    func addNewTask() {
        let newTask = Task(title: inputValue, completed: false)
        context.insert(newTask)
        inputValue = ""
    }
    
    //    func completeTask(id: UUID){
    //        if let completedTaskID = tasks.firstIndex(where: {$0.id == id}) {
    //            tasks[completedTaskID].completed.toggle()
    //        }
    //    }
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self)
}
