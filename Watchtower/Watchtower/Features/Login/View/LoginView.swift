//
//  LoginView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 23/03/23.
//

import SwiftUI
import AuthenticationServices

struct LoginView<ViewModel>: View where ViewModel: LoginViewModelTemplate {
    @ObservedObject var viewModel: ViewModel
    @ObservedObject var router: LoginRoute

    @State private var shouldShowInfo: Bool = false

    var body: some View {
        ZStack {
            BackgroundCastleView()

            VStack {
                Spacer()

                LogoView()

                Spacer()

                Button {
                    router.push(to: .dashboard)
                } label: {
                    Text("Iniciar Sessão Local")
                        .bold()
                        .padding(4)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)

                Spacer()

                SecondaryActionButton("O que é a Sessão Local?") {
                    router.isPresentingInfo = true
                }
                .sheet(isPresented: $router.isPresentingInfo, content: {
                    router.present(sheet: .info)
                })
            }
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
            viewModel: LoginViewModel(),
            router: .init(coordinator: AppCoordinator(isLoggedIn: true))
        )
        .tint(.flame)
    }
}
