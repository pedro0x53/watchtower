//
//  SecondaryActionButton.swift
//  Watchtower
//
//  Created by Pedro Sousa on 23/03/23.
//

import SwiftUI

struct SecondaryActionButton: View {
    var title: String
    var action: (() -> Void)?

    init(_ title: String, action: (() -> Void)? = nil) {
        self.title = title
        self.action = action
    }

    var body: some View {
        Button {
            if let action = self.action {
                action()
            }
        } label: {
            Text(title)
        }
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
