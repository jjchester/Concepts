//
//  DispatchMainQueueButtonView.swift
//  Concepts
//
//  Created by Justin Chester on 2023-07-05.
//

import SwiftUI

struct DispatchMainQueueButtonView: View {
    @State var loadingLabelText: String = "Press me"
    @State var isButtonDisabled: Bool = false
    @State var toggleValue: Bool = false
    @State var toggle2Value: Bool = false
    @State var sliderValue: Float = 0.0
    
    var body: some View {
        VStack {
            Button {
                self.isButtonDisabled = true
                self.loadingLabelText = "Executing background task"
                Thread.sleep(forTimeInterval: 3)
                self.isButtonDisabled = false
                self.loadingLabelText = "Press me"
            } label: {
                Text(loadingLabelText)
            }
            .disabled(isButtonDisabled)
            .padding(.bottom)
            
            Toggle(isOn: $toggleValue, label: {
                Text("Regular Toggle")
            })
            .frame(width: 120)
            Toggle("Button Toggle", isOn: $toggle2Value)
                .toggleStyle(.button)
                .tint(.green)
            Slider(value: $sliderValue)
                .tint(.green)
                .frame(maxWidth: 200)

        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.red, lineWidth: 2) // <7>
        )
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct DispatchMainQueueButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DispatchMainQueueButtonView()
    }
}
