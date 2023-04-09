//
//  PercentView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 08/04/23.
//

import SwiftUI

struct PercentView: View {
    @State var percent: Double

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white, lineWidth: 4)

            Circle()
                .trim(from: 0, to: percent / 100)
                .stroke(Color.flame, lineWidth: 4)
                .rotationEffect(Angle(degrees: -90))

            HStack(alignment: .center) {
                Text("\(Int(percent))")
                    .font(.title)
                Text("%")
                    .font(.body)
                    .padding(.leading, -8)
            }
            .fontWeight(.bold)
        }
        .frame(width: 80, height: 80)
    }
}

struct PercentView_Previews: PreviewProvider {
    static var previews: some View {
        PercentView(percent: 10)
            .background(Color.gray)
    }
}
