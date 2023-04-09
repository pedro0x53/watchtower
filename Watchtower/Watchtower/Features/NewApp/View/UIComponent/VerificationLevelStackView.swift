//
//  VerificationLevelStackView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 09/04/23.
//

import SwiftUI

struct VerificationLevelStackView: View {
    @State private var selectedLevel: VerificationLevel {
        didSet {
            print("Outter: \(selectedLevel)")
        }
    }

    init(selectedLevel: VerificationLevel) {
        self.selectedLevel = selectedLevel
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Nível de Verificação")
                .fontWeight(.semibold)

            HStack(spacing: 8) {
                ForEach(VerificationLevel.allCases) { level in
                    VerificationLevelView(level: level,
                                          currentLevel: $selectedLevel)
                }
            }
        }
    }
}

struct VerificationLevelStackView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationLevelStackView(selectedLevel: .l1)
            .padding()
    }
}
