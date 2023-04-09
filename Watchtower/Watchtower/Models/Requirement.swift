//
//  Requirement.swift
//  Watchtower
//
//  Created by Pedro Sousa on 09/04/23.
//

import Foundation

struct Requirement: Identifiable {
    let id: Int
    var masvsID: String { self.category.MSTG + "-\(self.id)"}
    let category: MASVSCategory
    let testCases: [TestCase]
    let description: String
    let isChecked: Bool
}

struct TestCase: Identifiable {
    var id: Int
    var type: Case
    var url: URL

    enum Case: String {
        case common = "Common"
        case ios = "iOS"
        case android = "Android"
    }
}
