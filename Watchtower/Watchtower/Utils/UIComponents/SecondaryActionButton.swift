//
//  SecondaryActionButton.swift
//  Watchtower
//
//  Created by Pedro Sousa on 23/03/23.
//

import SwiftUI

struct SecondaryActionButton: View {
    var title: String
    var action: () -> Void

    init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    var body: some View {
        Button(title, action: action)
        .buttonStyle(.automatic)
        .tint(.flame)
    }
}

struct SecondaryActionButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryActionButton("Secondary Button") {
            print("Secondary Action")
        }
    }
}
