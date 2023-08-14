//
//  DashboardCoordinator.swift
//  Watchtower
//
//  Created by Pedro Sousa on 11/08/23.
//

import SwiftUI
import Combine

enum DashboardCoordinates: String, RawHashable {
    case project
}

class DashboardRoute: Route {
    let id: UUID = .init()
    var coordinator: any Coordinator

    init(coordinator: any Coordinator) {
        self.coordinator = coordinator
    }

//    TODO: ProjectRoute
    func push(to coordinate: DashboardCoordinates) {
//        self.coordinator.push(ProjectRoute(coordinator: self.coordinator))
    }

    func pop() {
        self.coordinator.pop()
    }

    @ViewBuilder func build() -> some View {
        DashboardView(viewModel: DashboardViewModel(store: .init(), stack: .shared),
                      router: self)
//        TODO: ProjectRoute
//        .navigationDestination(for: ProjectRoute.self) { router in
//            router.build()
//        }
    }
}

extension DashboardRoute {
    static func == (lhs: DashboardRoute, rhs: DashboardRoute) -> Bool {
        lhs.id == rhs.id
    }
}
