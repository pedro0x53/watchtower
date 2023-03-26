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
            LoginView(viewModel: LoginViewModel())
        }
    }
}
