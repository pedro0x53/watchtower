//
//  AppCardView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 08/04/23.
//

import SwiftUI

struct AppCardView: View {
    let name: String
    let level: VerificationLevel
    @State var percent: Double

    var body: some View {
        ZStack {
            GeometryReader { reader in
                Image("castle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.05)
                    .frame(height: reader.size.height * 1.5)
                    .padding(.leading, -70)
            }

            HStack {
                VStack(alignment: .leading) {
                    Spacer()

                    Text(name)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(self.level.description)
                        .fontWeight(.semibold)
                }

                Spacer()

                PercentView(percent: percent)
            }
        }
        .padding(16)
        .frame(height: 130)
        .background(Color.gold)
        .cornerRadius(8)
    }
}

struct AppCardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AppCardView(name: "MyApp", level: .l1r, percent: 10)
        }
        .padding(16)
    }
}
