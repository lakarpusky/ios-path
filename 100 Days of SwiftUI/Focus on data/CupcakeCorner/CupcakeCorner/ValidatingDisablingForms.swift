//
//  ValidatingDisablingForms.swift
//  CupcakeCorner
//
//  Created by ☕️ Gabo.montero on 3/16/24.
//

import SwiftUI

struct ValidatingDisablingForms: View {
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            .textInputAutocapitalization(.never)
            
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            .disabled(disableForm)
        }
    }
}

#Preview {
    ValidatingDisablingForms()
}
