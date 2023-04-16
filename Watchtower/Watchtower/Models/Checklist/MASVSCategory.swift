//
//  MASVSCategory.swift
//  Watchtower
//
//  Created by Pedro Sousa on 09/04/23.
//

import Foundation

enum MASVSCategory: Int, Identifiable, CaseIterable, Codable {
    var id: Int { self.rawValue }

    case arch = 1
    case storage
    case crypto
    case auth
    case network
    case platform
    case code
    case resilience

    var name: String {
        switch self {
        case .arch:
            return "Arch"
        case .storage:
            return "Storage"
        case .crypto:
            return "Crypto"
        case .auth:
            return "Auth"
        case .network:
            return "Network"
        case .platform:
            return "Platform"
        case .code:
            return "Code"
        case .resilience:
            return "Resilience"
        }
    }

    var MSTG: String {
        return "MSTG-" + self.name.uppercased()
    }
}
