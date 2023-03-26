//
//  LoginViewModel.swift
//  Watchtower
//
//  Created by Pedro Sousa on 23/03/23.
//

import Foundation
import AuthenticationServices

class LoginViewModel: ObservableObject {
    func signInCompletion(result: Result<ASAuthorization, Error>) {
        switch result {
        case .success:
            let sessionID = getSessionID()
            StorageService.set(false, for: .isLocalSession)
            // MARK: TODO - Coordinate to Dashboard
        case .failure:
            print("Login Error")
        }
    }

    func startLocalSession() {
        let sessionID = getSessionID()
        StorageService.set(true, for: .isLocalSession)
        print("The local session ID is: \(sessionID)")
        // MARK: TODO - Coordinate to Dashboard
    }

    private func getSessionID() -> String {
        if let sessionID = StorageService.get(.sessionID) as? String {
            return sessionID
        } else {
            let sessionID = UUID().uuidString
            StorageService.set(sessionID, for: .sessionID)
            return sessionID
        }
    }
}
