//
//  TodoModel.swift
//  Concepts
//
//  Created by Justin Chester on 2023-07-10.
//

import Foundation

class TodoModel: ObservableObject {
    
    let todoManager = TodoManager.shared
    
    @Published var todos: [Todo] = []
    @Published var isLoading: Bool = true
    
    init() {
        DispatchQueue.global(qos: .background).async {
            let result = self.todoManager.loadTodos() ?? []
            DispatchQueue.main.async {
                self.todos = result
                self.isLoading = false
            }
        }
    }
    
    func save(_ text: String, isDone: Bool) {
        todoManager.saveTodo(text: text, isDone: isDone)
        self.todos = todoManager.loadTodos() ?? []
    }
    
    func move(from source: IndexSet, to destination: Int) {
        // TODO (Pun intended)
        // Add ordering to todo data object so that reordering the list can be persistent
        self.todos.move(fromOffsets: source, toOffset: destination)
        todoManager.saveContext()
    }
    
    func delete(at offsets: IndexSet) {
        for index in offsets {
            todoManager.deleteTodo(todos[index])
        }
        todos.remove(atOffsets: offsets)
    }
}
