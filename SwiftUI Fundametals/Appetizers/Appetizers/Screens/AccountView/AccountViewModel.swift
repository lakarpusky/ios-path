//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by ☕️ Gabo.montero on 5/13/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            // .. encode our User to Data
            let data = try JSONEncoder().encode(user)
            userData = data // .. and store it in UserDefaults
            alertItem = AlertContext.userSavedSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retreiveUser() {
        guard let userData else { return }
        
        do {
            // .. decode our user Data to a User object
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    var isFieldsEmpty: Bool {
        return user.firstName.isEmpty && user.lastName.isEmpty && user.email.isEmpty
    }
    
    var isValidForm: Bool {
        guard !isFieldsEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
}
