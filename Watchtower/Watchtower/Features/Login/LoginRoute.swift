//
//  LoginCoordinator.swift
//  Watchtower
//
//  Created by Pedro Sousa on 11/08/23.
//

import SwiftUI
import Combine

enum LoginCoodinates: String, RawHashable {
    case dashboard
}

final class LoginRoute: Route {
    let id: UUID = .init()
    var coordinator: any Coordinator

    init(coordinator: any Coordinator) {
        self.coordinator = coordinator
    }

    func push(to coordinate: LoginCoodinates) {
        self.coordinator.push(DashboardRoute(coordinator: self.coordinator))
    }

    func pop() {
        self.coordinator.pop()
    }

    @ViewBuilder func build() -> some View {
        LoginView(viewModel: LoginViewModel(),
                  router: self)
        .navigationDestination(for: DashboardRoute.self) { route in
            route.build()
        }
    }
}

extension LoginRoute {
    static func == (lhs: LoginRoute, rhs: LoginRoute) -> Bool {
        lhs.id == rhs.id
    }
}
