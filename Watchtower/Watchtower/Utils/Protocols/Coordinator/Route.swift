//
//  Route.swift
//  Watchtower
//
//  Created by Pedro Sousa on 17/08/23.
//

import Foundation

protocol Route: FlowBuilder {
    associatedtype Coordinates

    var coordinator: any Coordinator { get }

    func push(to coordinate: Coordinates)
    func pop()
}
