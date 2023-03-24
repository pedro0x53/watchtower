//
//  LoginView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 23/03/23.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            BackgroundCastleView()

            VStack {
                Spacer()
                
                LogoView()

                Spacer()

                LoginWithAppleButton()

                PrimaryActionButton("Iniciar Sessão Local") {
                    print("local session...")
                }
                
                Spacer()
                
                SecondaryActionButton("O que é a Sessão Local?") {
                    print("Sessão Local")
                }
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
