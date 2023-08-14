//
//  AppCoordinator.swift
//  Watchtower
//
//  Created by Pedro Sousa on 01/08/23.
//

import SwiftUI
import Combine

class AppCoordinator: Coordinator {
    let id: UUID = .init()

    var path: NavigationPath = NavigationPath()
    var isLoggedIn: Bool

    init(isLoggedIn: Bool) {
        self.isLoggedIn = isLoggedIn
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: AppCoordinator, rhs: AppCoordinator) -> Bool {
        lhs.id == rhs.id
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
                  coordinator: LoginCoordinator())
    }

    private func buildDashboard() -> some View {
        DashboardView(viewModel: DashboardViewModel(store: .init(),
                                                    stack: .shared),
                      coordinator: .init())
        .onAppear {
            KeysService.set(UUID(), for: .sessionID)
        }
    }
}
