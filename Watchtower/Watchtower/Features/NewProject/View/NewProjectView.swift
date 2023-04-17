//
//  NewProjectView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 09/04/23.
//

import SwiftUI

struct NewProjectView<ViewModel>: View where ViewModel: NewProjectViewModelTemplate {
    @State var name: String = ""
    @State var level: VerificationLevel = .l1

    @ObservedObject var viewModel: ViewModel

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

    func saveAction() {
        viewModel.createNewProject(named: name, level: level)
    }
}

struct NewAppView_Previews: PreviewProvider {
    static var previews: some View {
        NewProjectView(viewModel: NewProjectViewModel(stack: CoreDataStack.shared,
                                                      store: StorageService()))
            .tint(.flame)
    }
}
