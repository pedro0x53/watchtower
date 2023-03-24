//
//  BackgroundCastleView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 23/03/23.
//

import SwiftUI

struct BackgroundCastleView: View {
    var body: some View {
        GeometryReader { reader in
            VStack(alignment: .trailing) {
                Spacer()

                Image("castle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: reader.size.width * 1.5)
                    .opacity(0.05)
                    .padding(.bottom, -50)
                    .padding(.leading, reader.size.width / 5)
            }
        }
        .ignoresSafeArea()
    }
}

struct BackgroundCastleView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundCastleView()
    }
}
