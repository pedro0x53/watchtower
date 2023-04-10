//
//  DashboardView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 08/04/23.
//

import SwiftUI

struct DashboardView: View {

    private static let id = UUID()
    static var project: Project = {
        return Project(id: id, name: "Project", level: .l1)
    }()

    private static var chacklist: Checklist = {
        return Checklist(id: DashboardView.id.uuidString,
                         verifications: [
                            Verification(id: 0, name: "Verification 0",
                                         requirements: [
                                            Requirement(id: 0, category: .arch, testCases: [], description: "Desc...", isChecked: false)
                                         ])
                         ])
    }()

    @State private var isCreatingNewApp: Bool = false

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem()], spacing: 16) {
                    ForEach(0..<10) { id in
                        NavigationLink {
                            ProjectView(project: DashboardView.project,
                                        checklist: DashboardView.chacklist)
                        } label: {
                            AppCardView(name: "MyApp", level: .l1r, percent: Double(id))
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding(16)
            .navigationTitle("Projetos")
            .toolbar {
                Button {
                    isCreatingNewApp = true
                } label: {
                    Image(systemName: "plus")
                }

            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $isCreatingNewApp, content: {
            NewAppView()
        })
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .tint(.flame)
    }
}
