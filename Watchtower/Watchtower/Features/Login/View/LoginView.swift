//
//  LoginView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 23/03/23.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        ZStack {
            BackgroundCastleView()

            VStack {
                Spacer()

                LogoView()

                Spacer()

                PrimaryActionButton("Iniciar Sessão Local",
                                    action: didTaplocalSessionButton)

                Spacer()

                SecondaryActionButton("O que é a Sessão Local?",
                                      action: didTaplocalSessionInfoButton)
            }
            .padding()
        }
    }

    func didTaplocalSessionButton() {
        viewModel.startLocalSession()
    }

    func didTaplocalSessionInfoButton() {}
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
