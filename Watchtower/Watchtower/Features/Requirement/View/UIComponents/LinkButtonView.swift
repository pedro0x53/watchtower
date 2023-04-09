//
//  LinkButtonView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 09/04/23.
//

import SwiftUI

struct LinkButtonView: View {
    let name: String
    let url: URL

    var body: some View {
        HStack {
            Image(systemName: "link")
            Link(name, destination: url)
        }
        .fontWeight(.bold)
        .tint(.black)
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(Color.harvestGold)
        .clipShape(Capsule())
    }
}

struct LinkButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LinkButtonView(name: "Common", url: URL(string: "apple.com")!)
    }
}
