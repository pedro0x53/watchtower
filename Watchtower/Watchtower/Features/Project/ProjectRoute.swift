//
//  ProjectRoute.swift
//  Watchtower
//
//  Created by Pedro Sousa on 11/08/23.
//

import SwiftUI

enum ProjectCoordinates {}

class ProjectRoute: Route {
    var coordinator: any Coordinator

    let project: Project
    let checklist: Checklist

    init(coordinator: any Coordinator, project: Project, checklist: Checklist) {
        self.project = project
        self.checklist = checklist
        self.coordinator = coordinator
    }

    func push(to coordinate: ProjectCoordinates) {}

    func pop() {
        self.coordinator.pop()
    }

    @ViewBuilder func build() -> some View {
        ProjectView(project: project, checklist: checklist)
    }
}

extension ProjectRoute {
    static func == (lhs: ProjectRoute, rhs: ProjectRoute) -> Bool {
        lhs.id == rhs.id
    }
}
