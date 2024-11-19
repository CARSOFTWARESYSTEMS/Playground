//
//  TaskContentView.swift
//  Playground
//
//  Created by CAR Software Systems on 19/11/24.
//

import SwiftUI
import CoreData


struct TaskContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Task.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.title, ascending: true)]
    ) var tasks: FetchedResults<Task>
    
    @State private var newTaskTitle: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New Task", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: addTask) {
                        Image(systemName: "plus")
                    }
                    .padding(.leading, 5)
                }
                .padding()
                
                List {
                    ForEach(tasks) { task in
                        HStack {
                            Text(task.title ?? "Untitled")
                            Spacer()
                            if task.isCompleted {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.green)
                            } else {
                                Image(systemName: "square.and.pencil.circle")
                                    .foregroundColor(.red)
                            }
                        }
                        .onTapGesture {
                            toggleTaskCompletion(task)
                        }
                    }
                    .onDelete(perform: deleteTasks)
                }
            }
            .navigationTitle("Tasks")
        }
    }
    
    private func addTask() {
        withAnimation {
            let newTask = Task(context: viewContext)
            newTask.title = newTaskTitle
            newTask.isCompleted = false
            saveContext()
            newTaskTitle = ""
        }
    }
    
    private func toggleTaskCompletion(_ task: Task) {
        withAnimation {
            task.isCompleted.toggle()
            saveContext()
        }
    }
    
    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            offsets.map { tasks[$0] }.forEach(viewContext.delete)
            saveContext()
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
