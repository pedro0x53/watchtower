//
//  NSObject.swift
//  Watchtower
//
//  Created by Pedro Sousa on 16/04/23.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
