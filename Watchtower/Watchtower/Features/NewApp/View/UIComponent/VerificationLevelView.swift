//
//  VerificationLevelView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 09/04/23.
//

import SwiftUI

struct VerificationLevelView: View {
    let level: VerificationLevel
    @Binding var currentLevel: VerificationLevel

    var body: some View {
        ZStack(alignment: .center) {
                RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                    .fill(level == currentLevel ? Color.harvestGold : Color.antiFlashWhite)

            Text(level.description)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(level == currentLevel ? .white : .black)
                .padding(.vertical, 30)
                .scaledToFit()
                .minimumScaleFactor(0.8)
        }
        .frame(maxWidth: 80, maxHeight: 80)
        .onTapGesture {
            currentLevel = self.level
            print("Inner: \(currentLevel)")
        }
    }
}

struct VerificationLevelView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationLevelView(level: .l2r, currentLevel: .constant(.l1))
        .padding()
    }
}
