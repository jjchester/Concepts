//
//  TitleTextView.swift
//  Concepts
//
//  Created by Justin Chester on 2023-06-27.
//

import SwiftUI

struct TitleTextView: View {
    
    private var text: String
    private var textColor: Color
    
    init(_ textToDisplay: String, _ textColor: Color = .black) {
        self.text = textToDisplay
        self.textColor = textColor
    }
    
    var body: some View {
        Text(self.text)
            .foregroundColor(self.textColor)
            .font(.title2)
            .scaledToFill()
            .minimumScaleFactor(0.01)
    }
}
