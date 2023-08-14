//
//  WatchtowerApp.swift
//  Watchtower
//
//  Created by Pedro Sousa on 17/03/23.
//

import SwiftUI

@main
struct WatchtowerApp: App {
    @StateObject var appCoordinator = AppCoordinator(isLoggedIn: KeysService.has(key: .sessionID))
    @StateObject var state = AppState()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appCoordinator.path) {
                appCoordinator.build()
            }
            .tint(.flame)
            .environmentObject(state)
        }
    }
}
