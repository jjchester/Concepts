//
//  TodoModel.swift
//  Concepts
//
//  Created by Justin Chester on 2023-07-10.
//

import Foundation

class TodoModel {
    
    let todoManager = TodoManager.shared
    
    @Published var todos: [Todo] = []
    
    init() {
        todos = todoManager.loadTodos() ?? []
    }
    
    func save(_ text: String, isDone: Bool) {
        todoManager.saveTodo(text: text, isDone: isDone)
        self.todos = todoManager.loadTodos() ?? []
    }
    
    func move(from source: IndexSet, to destination: Int) {
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
