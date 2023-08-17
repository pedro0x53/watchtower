//
//  Flow.swift
//  Watchtower
//
//  Created by Pedro Sousa on 17/08/23.
//

import SwiftUI

public protocol Flow: AnyObject, Identifiable, Hashable, ObservableObject {}

public protocol FlowBuilder: Flow {
    associatedtype Build: View
    @ViewBuilder func build() -> Build
}

public extension Hashable where Self: Flow {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
