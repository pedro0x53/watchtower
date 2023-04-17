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

    @State private var shouldShowInfo: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundCastleView()

                VStack {
                    Spacer()

                    LogoView()

                    Spacer()

                    NavigationLink {
                        DashboardView(viewModel: DashboardViewModel(store: StorageService(),
                                                                    stack: CoreDataStack.shared))
                            .onAppear {
                                viewModel.startNewSession()
                            }
                    } label: {
                        Text("Iniciar Sessão Local")
                            .bold()
                            .padding(4)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)

                    Spacer()

                    SecondaryActionButton("O que é a Sessão Local?") {
                        shouldShowInfo = true
                    }
                    .sheet(isPresented: $shouldShowInfo, content: {
                        InfoView()
                            .presentationDetents([.fraction(2/5)])
                            .presentationDragIndicator(.visible)
                    })
                }
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
            .tint(.flame)
    }
}
