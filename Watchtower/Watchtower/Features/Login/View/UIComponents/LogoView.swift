//
//  LogoView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 23/03/23.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image("watchtower")
            .resizable()
            .frame(width: 180, height: 180)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
