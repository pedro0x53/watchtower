//
//  ProjectView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 09/04/23.
//

import SwiftUI

struct ProjectView: View {
    let project: Project
    @State private var checklist: Checklist = {
        Checklist(
            id: UUID().uuidString,
            verifications: [
                Verification(id: 0, name: "Verification",
                    requirements:
                        [
                            Requirement(id: 0, category: .arch,
                                        testCases: [], description: "",
                                        isChecked: true)
                        ] )
            ])
    }()

    init(project: Project, checklist: Checklist) {
        self.project = project
        self.checklist = checklist
    }

    @State private var isEditing: Bool = false

    var body: some View {
        NavigationStack {
            List(checklist.verifications) { verification in
                Section(verification.name) {
                    ForEach(verification.requirements) { requirement in
                        RequirementRowView(index: (verification.id, requirement.id),
                                           requirement: requirement,
                                           callback: checklistCallback)
                    }
                }
            }
            .padding(.top, 16)
            .navigationTitle(project.name!)
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                Button("Editar") {
                    isEditing = true
                }
            }
        }
    }

    private func checklistCallback(index: (Int, Int), value: Bool) {
        self.checklist.verifications[index.0].requirements[index.1].isChecked = value
    }
}
