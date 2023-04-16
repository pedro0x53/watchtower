//
//  VerificationLevel.swift
//  Watchtower
//
//  Created by Pedro Sousa on 09/04/23.
//
// swiftlint:disable identifier_name

import Foundation

enum VerificationLevel: Int, CustomStringConvertible, CaseIterable, Identifiable {

    var id: Int { self.rawValue }

    case l1 = 0
    case l2 = 1
    case l1r = 2
    case l2r = 3

    var description: String {
        switch self {
        case .l1:
            return "L1"
        case .l2:
            return "L2"
        case .l1r:
            return "L1+R"
        case .l2r:
            return "L2+R"
        }
    }
}
