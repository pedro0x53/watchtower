//
//  RequirementRowView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 09/04/23.
//

import SwiftUI

struct RequirementRowView: View {
    let index: (Int, Int)
    let requirement: Requirement
    let callback: ((_ index: (Int, Int), _ value: Bool) -> Void)?

    @State private var isChecked: Bool = false
    @State private var shouldShowInfo: Bool = false

    init(index: (Int, Int),
         requirement: Requirement,
         callback: (((Int, Int), Bool) -> Void)? = nil) {
        self.index = index
        self.requirement = requirement
        self.callback = callback
    }

    var body: some View {
        HStack {
            Image(systemName: isChecked ? "checkmark.circle.fill" : "circle.fill")
                .resizable()
                .foregroundColor(isChecked ? .flame : .antiFlashWhite)
                .frame(width: 25, height: 25)
                .animation(.easeInOut, value: isChecked)

            Text(requirement.masvsID)

            Spacer()

            Image(systemName: "info.circle")
                .onTapGesture {
                    shouldShowInfo = true
                }
                .foregroundColor(.harvestGold)
        }
        .onTapGesture {
            self.isChecked.toggle()
            callback?(index, self.isChecked)
        }
        .sheet(isPresented: $shouldShowInfo) {
            RequirementView(requirement: self.requirement)
                .presentationDetents([.medium, .large])
        }
    }
}

struct RequirementRowView_Previews: PreviewProvider {
    static var previews: some View {
        RequirementRowView(index: (0, 0),
                           requirement: Requirement(id: 1,
                                                    category: .arch,
                                                    testCases: [],
                                                    description: "Description...",
                                                    isChecked: true)) { index, value in
            print("Did change value at \(index) to \(value)")
        }
        .padding()
        .tint(.harvestGold)
    }
}
