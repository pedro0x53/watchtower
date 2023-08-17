//
//  AppCoordinator.swift
//  Watchtower
//
//  Created by Pedro Sousa on 01/08/23.
//

import SwiftUI

class AppCoordinator: Coordinator {
    let id: UUID = .init()

    @Published var path: NavigationPath
    var isLoggedIn: Bool

    init(path: NavigationPath = .init(), isLoggedIn: Bool) {
        self.isLoggedIn = isLoggedIn
        self.path = path
    }

    func push<R: Route>(_ route: R) {
        self.path.append(route)
    }

    func pop() {
        self.path.removeLast()
    }

    @ViewBuilder func build() -> some View {
        if isLoggedIn {
            buildDashboard()
        } else {
            buildLogin()
        }
    }

    private func buildLogin() -> some View {
        LoginView(viewModel: LoginViewModel(),
                  router: .init(coordinator: self))
        .navigationDestination(for: DashboardRoute.self) { route in
            route.build()
        }
    }

    private func buildDashboard() -> some View {
        DashboardView(viewModel: DashboardViewModel(store: .init(), stack: .shared),
                      router: .init(coordinator: self))
        .navigationDestination(for: ProjectRoute.self) { route in
            route.build()
        }
    }
}

extension AppCoordinator {
    static func == (lhs: AppCoordinator, rhs: AppCoordinator) -> Bool {
        lhs.isLoggedIn == rhs.isLoggedIn &&
        lhs.path == rhs.path &&
        lhs.id == rhs.id
    }
}
