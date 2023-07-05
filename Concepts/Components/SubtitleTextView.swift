//
//  SubtitleTextView.swift
//  Concepts
//
//  Created by Justin Chester on 2023-06-27.
//

import SwiftUI

struct SubtitleTextView: View {
    
    private var text: String
    private var color: Color
    
    init(_ text: String, color: Color = .black) {
        self.text = text
        self.color = color
    }
    
    var body: some View {
        Text(self.text)
            .font(.subheadline)
            .foregroundColor(self.color)
            .multilineTextAlignment(.leading)
    }
}
