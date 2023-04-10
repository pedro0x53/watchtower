//
//  NewAppView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 09/04/23.
//

import SwiftUI

struct NewAppView: View {
    @State var name: String = ""
    @State var level: VerificationLevel = .l1

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 30) {
                    LabeledTextField(fieldName: "Nome do Projeto", value: $name)

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
                    print("Save new Project")
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
