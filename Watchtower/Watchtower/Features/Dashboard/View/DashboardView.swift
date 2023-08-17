//
//  DashboardView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 08/04/23.
//

import SwiftUI

struct DashboardView<ViewModel>: View where ViewModel: DashboardViewModelTemplate {
    @ObservedObject var viewModel: ViewModel
    @ObservedObject var router: DashboardRoute

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem()], spacing: 16) {
                ForEach(viewModel.checklists) { checklist in
                    if let project = viewModel.getProjectforID(id: checklist.id!) {
                        NavigationLink {
                            ProjectView(project: project,
                                        checklist: checklist)
                        } label: {
                            AppCardView(name: project.name!,
                                        level: VerificationLevel(rawValue: Int(project.rawLevel))!,
                                        percent: 0)
                        }
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(16)
        .navigationTitle("Projetos")
        .toolbar {
            Button {
                router.isPresentingProjectEditor = true
            } label: {
                Image(systemName: "plus")
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $router.isPresentingProjectEditor,
            onDismiss: {
                viewModel.update()
            },
            content: {
                router.present(sheet: .projectEditor)
            }
        )
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(
            viewModel: DashboardViewModel(store: .init(), stack: .shared),
            router: .init(coordinator: AppCoordinator(isLoggedIn: true))
        )
        .tint(.flame)
    }
}
