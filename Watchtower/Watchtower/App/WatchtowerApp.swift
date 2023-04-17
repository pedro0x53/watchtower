//
//  WatchtowerApp.swift
//  Watchtower
//
//  Created by Pedro Sousa on 17/03/23.
//

import SwiftUI

@main
struct WatchtowerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if KeysService.get(.sessionID) == nil {
                    LoginView(viewModel: LoginViewModel())
                } else {
                    DashboardView(viewModel: DashboardViewModel(store: StorageService(),
                                                                stack: CoreDataStack.shared))
                }
            }
            .tint(.flame)
            .environmentObject(AppState())
        }
    }
}
