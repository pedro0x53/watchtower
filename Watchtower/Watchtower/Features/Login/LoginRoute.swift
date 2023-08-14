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

final class LoginRoute<Parent: Coordinator>: Coordinator {
    let id: UUID = .init()
    let parent: Parent

    init(parent: Parent) {
        self.parent = parent
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: LoginRoute, rhs: LoginRoute) -> Bool {
        lhs.id == rhs.id
    }

    @ViewBuilder func build() -> some View {
        LoginView(viewModel: LoginViewModel(),
                  coordinator: self)
        .navigationDestination(for: DashboardCoordinator.self) { coordinator in
            coordinator.build()
        }
    }

    func push<C>(_ coordinator: C) where C : Coordinator {
        self.parent.push(coordinator)
    }

    func pop() {
        self.parent.pop()
    }
}
