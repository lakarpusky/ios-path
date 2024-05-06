//
//  LoginScreen.swift
//  SwiftUIBlueprint
//
//  Created by ☕️ Gabo.montero on 5/6/24.
//

import SwiftUI

struct LoginScreen: View {
    // .. if our view model changes in any way
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                TextField(
                    "Login.UsernameField.Title".localized,
                    text: $viewModel.username
                )
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                .padding(.top, 20)
                
                Divider()
                
                SecureField(
                    "Login.PasswordField.Title".localized,
                    text: $viewModel.password
                )
                .padding(.top, 20)
                
                Divider()
            }
            
            Spacer()
            
            Button(action: {}) {
                Text("Login.LoginButton.Title".localized)
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding()
    }
}

#Preview {
    LoginScreen()
}
