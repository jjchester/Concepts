//
//  TodoView.swift
//  Concepts
//
//  Created by Justin Chester on 2023-07-10.
//

import SwiftUI

struct TodoView: View {
    var todo: Todo
    let manager = TodoManager.shared
    
    @State var isDone: Bool
    
    init(_ todo: Todo) {
        self.todo = todo
        self.isDone = todo.isDone
    }
    
    var body: some View {
        HStack {
            Text(todo.text ?? "")
                .font(Font.custom("Bradley Hand", size: 22))
            Spacer()
            Toggle("", isOn: $isDone)
                .toggleStyle(CheckBoxStyle())
                .onChange(of: isDone) { newValue in
                    self.todo.isDone = newValue
                    manager.saveContext()
                }
        }
    }
}
