//
//  StorageService.swift
//  Watchtower
//
//  Created by Pedro Sousa on 16/04/23.
//

import Foundation

class StorageService {
    private let manager = FileManager.default
    private static let directoryName: String = "checklists"

    private var documentsURL: URL {
        manager.urls(for: .documentDirectory, in: .userDomainMask).first!
    }

    private var checklistDirectoryURL: URL {
        let checklistURL = self.documentsURL.appendingPathComponent(StorageService.directoryName)
        return checklistURL
    }

    init() {
        setup()
    }

    private func setup() {
        var isDirectory: ObjCBool = false
        let exists = FileManager.default.fileExists(atPath: self.checklistDirectoryURL.path,
                                                    isDirectory: &isDirectory)
        if !exists && !isDirectory.boolValue {
            try? FileManager.default.createDirectory(
                                        at: self.checklistDirectoryURL,
                                        withIntermediateDirectories: true)
        }
    }

    func buildChecklistPath(forChecklistNamed checklistName: String) -> URL {
        return checklistDirectoryURL
                    .appending(component: checklistName)
                    .appendingPathExtension("json")
    }

    func readAllCheckLists() -> [Checklist] {
        guard let content = try? manager.contentsOfDirectory(atPath: checklistDirectoryURL.path)
        else { return [] }

        let checklists: [Checklist] = content.compactMap { fileName in
            let checklistURL = checklistDirectoryURL.appending(path: fileName)
            let checklistPath = checklistURL.path
            guard let rawCheckList = manager.contents(atPath: checklistPath),
                  var checklist = try? JSONDecoder().decode(Checklist.self,
                                                            from: rawCheckList),
                  let dotIndex: String.Index = fileName.firstIndex(of: ".")
            else { return nil }

            checklist.id = String(fileName[..<dotIndex])
            return checklist
        }

        return checklists
    }

    func writeAllChecklists(_ checklists: [Checklist]) {
        checklists.forEach { checklist in
            let checklistURL = self.buildChecklistPath(forChecklistNamed: checklist.id!)
            let checklistData = try? JSONEncoder().encode(checklists)
            try? checklistData?.write(to: checklistURL)
        }
    }

    func getTemplate(forLevel level: VerificationLevel) -> Data? {
        guard let levelURL = Bundle.main.url(forResource: level.description, withExtension: "json")
        else { return nil }
        return manager.contents(atPath: levelURL.path)
    }
}

extension StorageService {
    func createChecklist(named name: String, withLevel level: VerificationLevel) -> Bool {
        let checklistURL = self.buildChecklistPath(forChecklistNamed: name)
        guard let levelData = self.getTemplate(forLevel: level)
        else { return false }

        do {
            try levelData.write(to: checklistURL)
            return manager.fileExists(atPath: checklistURL.path)
        } catch {
            print(error.localizedDescription)
            return false
        }
    }

    func readChecklist(named name: String) -> Data? {
        let checklistURL = self.buildChecklistPath(forChecklistNamed: name)
        return manager.contents(atPath: checklistURL.path())
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
            try manager.removeItem(at: checklistURL)
            return manager.fileExists(atPath: checklistURL.path())
        } catch {
            return false
        }
    }
}
