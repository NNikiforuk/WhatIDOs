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
}

struct ContentView: View {
    @State private var tasks = [
        Task(id: 1, title: "Washing dishes"),
        Task(id: 2, title: "Vacuuming"),
        Task(id: 3, title: "Coding challeng"),
        Task(id: 4, title: "Cook dinner"),
        Task(id: 5, title: "Recruitment process"),
    ]
    
    @State private var newTask = ""
    
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
                    TextField("New task...", text: $newTask)
                        .onSubmit {
                            validate(createdTask: newTask)
                        }
                        .autocorrectionDisabled()
                        .textFieldStyle(.roundedBorder)
                        .shadow(
                            color: .gray,
                            radius: CGFloat(0.8))
                    Button(action: addNewTask) {
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
                        Spacer()
                            HStack {
                                Button(action: completeTask) {
                                    Image(systemName: "checkmark")
                                }
                                Button(action: deleteTask) {
                                    Image(systemName: "trash")
                                }
                                .padding(.horizontal, 10)
                                Button(action: editTask) {
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
    
    func editTask() {
        
    }
    
    func completeTask() {
        
    }
    
    func deleteTask() {
        
    }
    
    func validate(createdTask: String) {
        
    }
    
    func addNewTask() {
        
    }
}

#Preview {
    ContentView()
}
