//
//  LoginWithAppleButton.swift
//  Watchtower
//
//  Created by Pedro Sousa on 23/03/23.
//

import SwiftUI

struct LoginWithAppleButton: View {
    var body: some View {
        Button {
            print("Log in..")
        } label: {
            HStack {
                Image(systemName: "apple.logo")
                Text("Login com a Apple")
            }
            .padding(4)
            .frame(maxWidth: .infinity)
        }
        .bold()
        .tint(.black)
        .buttonStyle(.borderedProminent)
    }
}

struct LoginWithAppleButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginWithAppleButton()
    }
}
