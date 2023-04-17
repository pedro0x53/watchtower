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

    init(id: Int,
         category: MASVSCategory,
         testCases: [TestCase],
         description: String,
         isChecked: Bool) {
        self.id = id
        self.category = category
        self.testCases = testCases
        self.description = description
        self.isChecked = isChecked
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        let rawCategory = try container.decode(Int.self, forKey: .category)
        self.category = MASVSCategory(rawValue: rawCategory)!
        self.testCases = try container.decode([TestCase].self, forKey: .testCases)
        self.description = try container.decode(String.self, forKey: .description)
        self.isChecked = try container.decode(Bool.self, forKey: .isChecked)
    }
}

struct TestCase: Identifiable, Codable {
    var id: Int
    var type: Case
    var url: URL

    init(id: Int, type: Case, url: URL) {
        self.id = id
        self.type = type
        self.url = url
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        let rawType = try container.decode(Int.self, forKey: .type)
        self.type = Case(rawValue: rawType)!
        self.url = try container.decode(URL.self, forKey: .url)
    }
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
