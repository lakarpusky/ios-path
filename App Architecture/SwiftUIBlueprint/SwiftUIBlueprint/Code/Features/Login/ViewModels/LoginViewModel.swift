//
//  LoginViewModel.swift
//  SwiftUIBlueprint
//
//  Created by ☕️ Gabo.montero on 5/6/24.
//

import Foundation

// .. our view model needs to be an (ObservableObject) in order 
// .. for the (LoginScreen) to be re-rendered whenever any of the
class LoginViewModel: ObservableObject {
    // .. (Published) variables change their state.
    @Published var username = ""
    @Published var password = ""
    
    // .. to send API request to the servver via the (LoginAction)
    // .. and to navigate the user to the home screen if the request success
    func login() {
        LoginAction(
            parameters: LoginRequest(
                username: username,
                password: password
            )
        ).call { _ in
            // login successful, navigate to the Home screen
        }
    }
}
