//
//  LoginCoordinator.swift
//  Watchtower
//
//  Created by Pedro Sousa on 11/08/23.
//

import SwiftUI

enum LoginCoodinates {
    case dashboard
}

enum LoginSheets {
    case info
}

final class LoginRoute: Route {
    let id: UUID = .init()
    var coordinator: any Coordinator

    @Published var isPresentingInfo: Bool = false

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

extension LoginRoute: Presenter {
    func present(sheet: LoginSheets) -> some View {
        InfoView()
            .presentationDetents([.fraction(2/5)])
            .presentationDragIndicator(.visible)
    }

    func dismiss(sheet: LoginSheets) {
        self.isPresentingInfo = false
    }
}

extension LoginRoute {
    static func == (lhs: LoginRoute, rhs: LoginRoute) -> Bool {
        lhs.id == rhs.id
    }
}
