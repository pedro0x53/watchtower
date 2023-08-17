//
//  DashboardCoordinator.swift
//  Watchtower
//
//  Created by Pedro Sousa on 11/08/23.
//

import SwiftUI

enum DashboardCoordinates {
    case project
}

enum DashboardSheets {
    case projectEditor
}

class DashboardRoute: Route {
    let id: UUID = .init()
    var coordinator: any Coordinator

    @Published var isPresentingProjectEditor: Bool = false

    init(coordinator: any Coordinator) {
        self.coordinator = coordinator
    }

    func push(to coordinate: DashboardCoordinates) {}

    func pushToProject(with project: Project, checklist: Checklist) {
        self.coordinator.push(ProjectRoute(coordinator: self.coordinator,
                                           project: project,
                                           checklist: checklist))
    }

    func pop() {
        self.coordinator.pop()
    }

    @ViewBuilder func build() -> some View {
        DashboardView(viewModel: DashboardViewModel(store: .init(), stack: .shared),
                      router: self)
        .navigationDestination(for: ProjectRoute.self) { router in
            router.build()
        }
    }
}

extension DashboardRoute: Presenter {
    func present(sheet: DashboardSheets) -> some View {
        NewProjectView(viewModel: NewProjectViewModel(stack: .shared, store: .init()),
                       router: self)
    }

    func dismiss(sheet: DashboardSheets) {
        self.isPresentingProjectEditor = false
    }
}

extension DashboardRoute {
    static func == (lhs: DashboardRoute, rhs: DashboardRoute) -> Bool {
        lhs.id == rhs.id
    }
}
