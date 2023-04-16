//
//  StorageService.swift
//  Watchtower
//
//  Created by Pedro Sousa on 26/03/23.
//

import Foundation

class KeysService {
    enum Keys: String {
        case sessionID
        case isLocalSession
    }

    static func get(_ key: KeysService.Keys) -> Any? {
        return UserDefaults.standard.value(forKey: key.rawValue)
    }

    static func set(_ value: Any?, for key: KeysService.Keys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
}
