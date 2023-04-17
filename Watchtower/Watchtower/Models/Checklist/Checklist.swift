//
//  Checklist.swift
//  Watchtower
//
//  Created by Pedro Sousa on 09/04/23.
//

import Foundation

struct Checklist: Codable, Identifiable {
    let id: String
    var verifications: [Verification]
}
