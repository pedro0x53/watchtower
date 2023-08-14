//
//  Coordinator.swift
//  Watchtower
//
//  Created by Pedro Sousa on 11/08/23.
//

import SwiftUI
import Combine

protocol FlowBuilder: AnyObject, Identifiable, Hashable, ObservableObject {
    associatedtype Build: View
    @ViewBuilder func build() -> Build
}

protocol Route: FlowBuilder {
    associatedtype Coordinates

    var parent: any Coordinator { get }

    func push(to coordinate: Coordinates)
    func pop()
}

protocol Coordinator: FlowBuilder {
    var path: NavigationPath { get set }

    func push<R: Route>(_ route: R)
    func pop()
}
