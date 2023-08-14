//
//  DashboardCoordinator.swift
//  Watchtower
//
//  Created by Pedro Sousa on 11/08/23.
//

import SwiftUI
import Combine

class DashboardCoordinator: Coordinator {
    let id: UUID = .init()

    var path: NavigationPath = NavigationPath()

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: DashboardCoordinator, rhs: DashboardCoordinator) -> Bool {
        lhs.id == rhs.id
    }

    @ViewBuilder func build() -> some View {
        DashboardView(viewModel: DashboardViewModel(store: .init(),
                                                    stack: .shared),
                      coordinator: .init())
    }
}
