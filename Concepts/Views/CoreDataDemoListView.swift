//
//  CoreDataDemoListView.swift
//  Concepts
//
//  Created by Justin Chester on 2023-07-10.
//

import SwiftUI

struct CoreDataDemoListView: View {
    
    @State var presentingAlert = false
    @State var todoText = ""

    @StateObject var todoModel = TodoModel()
    
    var body: some View {
        VStack() {
            Button {
                presentingAlert.toggle()
            } label: {
                Text("Add")
            }
            .padding()
            .alert("Add Todo Item", isPresented: $presentingAlert) {
                TextField("e.g. Wash the dishes", text: $todoText)
                Button("OK", action: submit)
                Button("Cancel", action: {})
            }
            .buttonStyle(.bordered)
            List {
                if todoModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ForEach (todoModel.todos) { todo in
                        TodoView(todo)
                    }
                    .onDelete(perform: delete)
                    .onMove { from, to in
                        todoModel.move(from: from, to: to)
                    }
                    .padding(.top)
                }
            }

            //.scrollContentBackground(.hidden)
            .listStyle(.plain)
            .cardBackground()
            .padding([.leading, .trailing])
            .frame(maxHeight: 400)
        }
    }
    
    
    func submit() {
        guard todoText != "" else { return }
        todoModel.save(todoText, isDone: false)
        todoText = ""
    }
    
    func delete(at offsets: IndexSet) {
        todoModel.delete(at: offsets)
    }
}

struct CoreDataDemoListView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataDemoListView()
    }
}
