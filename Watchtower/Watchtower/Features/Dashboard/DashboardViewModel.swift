//
//  DashboardViewModel.swift
//  Watchtower
//
//  Created by Pedro Sousa on 17/04/23.
//

import Foundation

protocol DashboardViewModelTemplate: ObservableObject {
    var checklists: [Checklist] { get }
    var apps: [String: Project] { get }

    func getProjectforID(id: String) -> Project?
    func update()
}

class DashboardViewModel: DashboardViewModelTemplate {
    @Published private(set) var checklists: [Checklist] = []
    var apps: [String: Project] = [:]

    private let store: StorageService
    private let stack: CoreDataStack

    init(store: StorageService, stack: CoreDataStack) {
        self.store = store
        self.stack = stack

        self.prepare()
    }

    private func prepare() {
        self.checklists = self.store.readAllCheckLists()
        Project.all().forEach { self.apps[$0.identifier!] = $0 }
    }

    func update() {
        self.prepare()
    }

    func getProjectforID(id: String) -> Project? {
        return apps[id]
    }
}
