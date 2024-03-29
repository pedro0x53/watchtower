//
//  CoreDataStack.swift
//  Watchtower
//
//  Created by Pedro Sousa on 16/04/23.
//

import Foundation
import CoreData

class CoreDataStack {
    static var shared = CoreDataStack()

    private init() {}

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Watchtower")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })

        return container
    }()

    lazy var mainContext = persistentContainer.viewContext

    func saveContext() {
        let context = mainContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func createProject(named name: String, id: String, ownerID: String, level: Int16) {
        let checklist = Project(context: self.mainContext)
        checklist.identifier = id
        checklist.name = name
        checklist.ownerID = ownerID
        checklist.rawLevel = level

        self.saveContext()
    }
}
