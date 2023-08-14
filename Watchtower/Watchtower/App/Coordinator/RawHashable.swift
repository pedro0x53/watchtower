//
//  RawHashable.swift
//  Watchtower
//
//  Created by Pedro Sousa on 11/08/23.
//

import Foundation

protocol RawHashable: RawRepresentable, Hashable {}

extension RawHashable where Self.RawValue == String {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}
