//
//  Requirement.swift
//  Watchtower
//
//  Created by Pedro Sousa on 09/04/23.
//

import Foundation

struct Requirement: Identifiable, Codable {
    let id: Int
    var masvsID: String { self.category.MSTG + "-\(self.id)"}
    let category: MASVSCategory
    let testCases: [TestCase]
    let description: String
    var isChecked: Bool
}

struct TestCase: Identifiable, Codable {
    var id: Int
    var type: Case
    var url: URL
}

enum Case: Int, Codable {
    case common = 0
    case ios = 1
    case android = 2

    var name: String {
        switch self {
        case .common:
            return "Common"
        case .ios:
            return "iOS"
        case .android:
            return "Android"
        }
    }
}
