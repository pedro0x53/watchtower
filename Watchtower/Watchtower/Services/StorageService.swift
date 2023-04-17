//
//  StorageService.swift
//  Watchtower
//
//  Created by Pedro Sousa on 16/04/23.
//

import Foundation

class StorageService {
    private static let manager = FileManager.default
    private static let directoryName: String = "checklists"

    private var documentsURL: URL {
        StorageService.manager.urls(for: .documentDirectory, in: .userDomainMask).first!
    }

    private var checklistURL: URL {
        self.documentsURL.appendingPathComponent(StorageService.directoryName)
    }

    func buildChecklistPath(forChecklistNamed checklistName: String) -> URL {
        return checklistURL
                    .appending(component: StorageService.directoryName)
                    .appending(component: checklistName)
                    .appendingPathExtension("json")
    }

    func readAllCheckLists() -> [Checklist] {
        guard let content = try? StorageService.manager.contentsOfDirectory(atPath: checklistURL.path())
        else { return [] }

        let checklists: [Checklist] = content.compactMap { path in
            guard let rawCheckList = StorageService.manager.contents(atPath: path),
                  let checklist = try? JSONDecoder().decode(Checklist.self, from: rawCheckList)
            else { return nil }
            return checklist
        }

        return checklists
    }

    func writeAllChecklists(_ checklists: [Checklist]) {
        checklists.forEach { checklist in
            let checklistURL = self.buildChecklistPath(forChecklistNamed: checklist.id)
            let checklistData = try? JSONEncoder().encode(checklists)
            try? checklistData?.write(to: checklistURL)
        }
    }

    func getTemplate(forLevel level: VerificationLevel) -> Data? {
        guard let levelURL = Bundle.main.url(forResource: level.description, withExtension: "json")
        else { return nil }
        return StorageService.manager.contents(atPath: levelURL.path())
    }
}

extension StorageService {
    func createChecklist(named name: String, withLevel level: VerificationLevel) -> Bool {
        let checklistURL = self.buildChecklistPath(forChecklistNamed: name)
        guard let levelData = self.getTemplate(forLevel: level)
        else { return false }

        do {
            try levelData.write(to: checklistURL)
            return StorageService.manager.fileExists(atPath: checklistURL.path())
        } catch {
            return false
        }
    }

    func readChecklist(named name: String) -> Data? {
        let checklistURL = self.buildChecklistPath(forChecklistNamed: name)
        return StorageService.manager.contents(atPath: checklistURL.path())
    }

    func updateChecklist(named name: String, withData data: Data) -> Bool {
        let checklistURL = self.buildChecklistPath(forChecklistNamed: name)
        do {
            try data.write(to: checklistURL)
            return true
        } catch {
            return false
        }
    }

    func deleteChecklist(named name: String) -> Bool {
        let checklistURL = self.buildChecklistPath(forChecklistNamed: name)
        do {
            try StorageService.manager.removeItem(at: checklistURL)
            return StorageService.manager.fileExists(atPath: checklistURL.path())
        } catch {
            return false
        }
    }
}
