//
//  LabeledTextField.swift
//  Watchtower
//
//  Created by Pedro Sousa on 09/04/23.
//

import SwiftUI

struct LabeledTextField: View {
    let fieldName: String
    @Binding var value: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(fieldName)
                .font(.body)
                .fontWeight(.semibold)
            TextField("", text: $value)
                .padding()
                .background(Color.antiFlashWhite)
                .cornerRadius(8)
        }
    }
}

struct LabeledTextField_Previews: PreviewProvider {
    static var previews: some View {
        LabeledTextField(fieldName: "Name", value: .constant(""))
            .padding()
    }
}
