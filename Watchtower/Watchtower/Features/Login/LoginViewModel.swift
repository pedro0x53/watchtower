//
//  LoginViewModel.swift
//  Watchtower
//
//  Created by Pedro Sousa on 16/04/23.
//

import Foundation

protocol LoginViewModelTemplate: ObservableObject {
    func startNewSession()
}

class LoginViewModel: LoginViewModelTemplate {
    func startNewSession() {
        StorageService.set(UUID().uuidString, for: .sessionID)
    }
}
