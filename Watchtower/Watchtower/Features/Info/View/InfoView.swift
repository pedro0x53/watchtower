//
//  InfoView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 08/04/23.
//
// swiftlint:disable line_length

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("O que é a Sessão Local?")
                .font(.title)
            Text("A Sessão Local é uma maneira de armazenar suas checklists localmente. Ao iniciar uma Sessão Local, uma UUID é gerada e todos os Apps cadastrados pertencem a essa ID. Futuramente, você poderá fazer o upload para o iCloud das suas checklists.")
            Spacer()
        }
        .padding(24)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
