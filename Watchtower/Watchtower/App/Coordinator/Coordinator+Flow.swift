//
//  Coordinator+Route+FlowBuidler.swift
//  Watchtower
//
//  Created by Pedro Sousa on 11/08/23.
//

import SwiftUI

// TODO: Add suport to presenting views

public protocol FlowBuilder: AnyObject, Identifiable, Hashable, ObservableObject {
    associatedtype Build: View
    @ViewBuilder func build() -> Build
}

public extension Hashable where Self: FlowBuilder {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}

protocol Route: FlowBuilder {
    associatedtype Coordinates

    var coordinator: any Coordinator { get }

    func push(to coordinate: Coordinates)
    func pop()
}

protocol Coordinator: FlowBuilder {
    var path: NavigationPath { get set }

    func push<R: Route>(_ route: R)
    func pop()
}
