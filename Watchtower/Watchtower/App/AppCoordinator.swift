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
        LoginRoute(coordinator: self).build()
    }

    private func buildDashboard() -> some View {
        DashboardRoute(coordinator: self).build()
    }
}

extension AppCoordinator {
    static func == (lhs: AppCoordinator, rhs: AppCoordinator) -> Bool {
        lhs.isLoggedIn == rhs.isLoggedIn &&
        lhs.path == rhs.path &&
        lhs.id == rhs.id
    }
}
