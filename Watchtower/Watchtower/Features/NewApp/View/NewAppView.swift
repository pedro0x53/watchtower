//
//  NewAppView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 09/04/23.
//

import SwiftUI

struct NewAppView: View {
    @State var name: String = ""
    @State var level: VerificationLevel = .l1 {
        didSet {
            print("Did change level to: \(level)")
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 30) {
                    LabeledTextField(fieldName: "Nome do App", value: $name)

                    VerificationLevelStackView(selectedLevel: level)

                    VStack(alignment: .leading) {
                        Text(level.description)
                            .font(.title2)
                            .fontWeight(.semibold)

                        Text("Description...")
                    }
                }
            }
            .padding(16)
            .toolbar {
                Button {
                    print("Save new App")
                } label: {
                    Text("Salvar")
                        .fontWeight(.bold)
                }

            }
        }
    }
}

struct NewAppView_Previews: PreviewProvider {
    static var previews: some View {
        NewAppView(name: "", level: .l1)
            .tint(.flame)
    }
}
