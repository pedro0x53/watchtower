//
//  Coordinator.swift
//  Watchtower
//
//  Created by Pedro Sousa on 17/08/23.
//

import SwiftUI

protocol Coordinator: FlowBuilder {
    var path: NavigationPath { get set }

    func push<R: Route>(_ route: R)
    func pop()
}
