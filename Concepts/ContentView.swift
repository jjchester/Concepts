//
//  ContentView.swift
//  Concepts
//
//  Created by Justin Chester on 2023-06-27.
//

import SwiftUI

struct ContentView: View {
    
    let categories: [CategoryModel]
    @State private var path: [ConceptTile] = [] // Nothing on the stack by default.
    private var bgColors: [Color] = [ .indigo, .yellow, .green, .orange, .brown ]
    init() {
        self.categories = CategoryData.categoryData
    }
    
    var body: some View {
            NavigationStack {
                ScrollView {
                    ForEach(categories) { category in
                            NavigationLink {
                                ConceptView(title: category.title)
                                    .navigationTitle(category.title)
                            } label: {
                                ConceptTile(title: category.title, description: category.description)
                                    .padding([.leading, .trailing])
                            }
                        }
                    .navigationTitle("Concepts")
                    .padding([.top])
                }
            }
        }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
