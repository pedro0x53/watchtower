//
//  NewProjectViewModel.swift
//  Watchtower
//
//  Created by Pedro Sousa on 17/04/23.
//

import Foundation

protocol NewProjectViewModelTemplate: ObservableObject {
    func createNewProject(named name: String, level: VerificationLevel)
}

class NewProjectViewModel: NewProjectViewModelTemplate {
    let stack: CoreDataStack
    let store: StorageService

    init(stack: CoreDataStack, store: StorageService) {
        self.stack = stack
        self.store = store
    }

    func createNewProject(named name: String, level: VerificationLevel) {
        let checklistID = UUID().uuidString

        guard store.createChecklist(named: checklistID, withLevel: level),
              let ownerID = KeysService.get(.sessionID) as? String
        else { return }

        stack.createProject(named: name, id: checklistID,
                            ownerID: ownerID, level: Int16(level.rawValue))
    }
}
