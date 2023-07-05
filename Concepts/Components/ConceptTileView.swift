//
//  ConceptTileView.swift
//  Concepts
//
//  Created by Justin Chester on 2023-06-27.
//

import Foundation
import SwiftUI

struct ConceptTile: View {
    
    private var titleText: String
    private var descriptionText: String
    private var tileColor: Color
    
    init(title: String, description: String, color: Color = .white) {
        self.titleText = title
        self.descriptionText = description
        self.tileColor = color
    }
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 10) {
                TitleTextView(self.titleText)
                SubtitleTextView(self.descriptionText)
                    .padding(.trailing)
            }
            .frame(alignment: .leading)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(self.tileColor)
        .padding()
        .cardBackground()
        .listRowBackground(Color.white)
    }

    
    struct ConceptTile_Previews: PreviewProvider {
        static var previews: some View {
            ConceptTile(title: "Grand Central Dispatch", description: "Learn about Apple's concurrency library.Learn about Apple's concurrency library.Learn about Apple's concurrency library.")
        }
    }
}

