//
//  Session.swift
//  Watchtower
//
//  Created by Pedro Sousa on 08/04/23.
//

import Foundation

struct Session {
    var sessionID: String {
        if let sessionID = KeysService.get(.sessionID) as? String {
            return sessionID
        } else {
            let sessionID = UUID().uuidString
            KeysService.set(sessionID, for: .sessionID)
            return sessionID
        }
    }
}
