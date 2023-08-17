//
//  Project+CoreDataProperties.swift
//  Watchtower
//
//  Created by Pedro Sousa on 01/08/23.
//
//

import Foundation
import CoreData

extension Project {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project")
    }

    @NSManaged public var identifier: String?
    @NSManaged public var name: String?
    @NSManaged public var ownerID: String?
    @NSManaged public var rawLevel: Int16
}

extension Project: Identifiable {}

extension Project: CoreDataModel {}
