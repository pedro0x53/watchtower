//
//  RequirementView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 09/04/23.
//

import SwiftUI

struct RequirementView: View {
    let requirement: Requirement

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 30) {
                    HStack {
                        Text("MASVS ID: ")
                            .fontWeight(.bold)
                        Text(requirement.masvsID)
                        Spacer()
                    }
                    .font(.body)
                    
                    if !requirement.testCases.isEmpty {
                        VStack(alignment: .leading) {
                            Text("Test Case:")
                                .fontWeight(.bold)
                            Grid(alignment: .leading, horizontalSpacing: 16, verticalSpacing: 16) {
                                ForEach(requirement.testCases) { testCase in
                                    LinkButtonView(name: testCase.type.name,
                                                   url: testCase.url)
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Descrição:")
                            .fontWeight(.bold)
                        Text(requirement.description)
                    }
                }
            }
            .padding(16)
            .navigationTitle(requirement.category.name)
        }
    }
}

struct RequirementView_Previews: PreviewProvider {
    static var previews: some View {
        RequirementView(requirement:
                Requirement(id: 1,
                            category: .arch,
                            testCases: [
                                TestCase(id: 0, type: .common, url: URL(string: "apple.com")!)
                            ],
                            description: "Description...",
                            isChecked: true)
        )
        .padding()
    }
}
