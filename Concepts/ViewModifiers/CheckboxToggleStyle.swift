//
//  CheckboxToggleStyle.swift
//  Concepts
//
//  Created by Justin Chester on 2023-07-10.
//

import Foundation
import SwiftUI

struct CheckBoxStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.black)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            configuration.label
        }
    }
}
