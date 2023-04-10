//
//  Verification.swift
//  Watchtower
//
//  Created by Pedro Sousa on 09/04/23.
//

import Foundation

struct Verification: Identifiable {
    let id: Int
    let name: String
    var requirements: [Requirement]
}
