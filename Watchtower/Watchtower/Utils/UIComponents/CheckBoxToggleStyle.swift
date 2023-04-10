//
//  CheckboxToggleStyle.swift
//  Watchtower
//
//  Created by Pedro Sousa on 09/04/23.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(configuration.isOn ? .flame : .antiFlashWhite)
                    .background {
                        Circle()
                            .fill(Color.antiFlashWhite)
                    }
                configuration.label
                    .tint(.black)
            }
        })
    }
}
