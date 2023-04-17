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

        guard store.createChecklist(named: checklistID, withLevel: level)
        else { return }

        let checklist = Project(context: stack.mainContext)
        checklist.identifier = checklistID
        checklist.name = name
        checklist.ownerID = KeysService.get(.sessionID) as? String
        checklist.rawLevel = Int16(level.rawValue)

        stack.saveContext()
    }
}
