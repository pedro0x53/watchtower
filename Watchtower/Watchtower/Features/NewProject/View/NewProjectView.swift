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
    @ObservedObject var router: DashboardRoute

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
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        saveAction()
                    } label: {
                        Text("Salvar")
                            .fontWeight(.bold)
                    }
                }

                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        router.isPresentingProjectEditor = false
                    } label: {
                        Text("Cancelar")
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }

    func saveAction() {
        viewModel.createNewProject(named: name, level: level)
        router.isPresentingProjectEditor = false
    }
}

struct NewAppView_Previews: PreviewProvider {
    static var previews: some View {
        NewProjectView(viewModel: NewProjectViewModel(stack: CoreDataStack.shared,
                                                      store: StorageService()),
                       router: DashboardRoute(coordinator: AppCoordinator(isLoggedIn: true)))
            .tint(.flame)
    }
}
