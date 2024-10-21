//
//  ContentView.swift
//  whatIDOs
//
//  Created by Natalia Nikiforuk on 20/10/2024.
//

import SwiftUI

struct Task: Identifiable {
    var id: Int
    var title: String
    var completed: Bool
}

struct ContentView: View {
    @State private var tasks: [Task] = [
        Task(id: 1, title: "Washing dishes", completed: false),
        Task(id: 2, title: "Vacuuming", completed: false),
        Task(id: 3, title: "Coding challenge", completed: false),
        Task(id: 4, title: "Cook dinner", completed: false),
        Task(id: 5, title: "Recruitment process", completed: false),
    ]
    
    @State private var inputValue = ""
    
    var body: some View {
            VStack(alignment: .leading) {
                VStack {
                    Text("whatIDOs")
                }
                .foregroundColor(.mint)
                .opacity(2)
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
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
                .padding(.vertical, 40)
                ForEach(tasks) { task in
                    HStack {
                            Text(task.title)
                                .strikethrough(task.completed == true, color: .white)
                        Spacer()
                            HStack {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "checkmark")
                                } 
                                Button {
                                    deleteTask(id: task.id)
                                } label: {
                                    Image(systemName: "trash")
                                }
                                .padding(.horizontal, 10)
                                Button {
                                    editTask(id: task.id)
                                } label: {
                                    Image(systemName: "pencil")
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
            .padding()
            Spacer()
        }
    
    func deleteTask(id: Int) {
        tasks.removeAll() { $0.id == id }
    }
    
    func addNewTask() {
        tasks.append(Task(id: 10, title: inputValue, completed: false))
        inputValue = ""
    }
    
    func editTask(id: Int) {
        
    }
    
    func validate(createdTask: String) {
        
    }
}

#Preview {
    ContentView()
}
