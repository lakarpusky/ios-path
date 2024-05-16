//
//  AccountView.swift
//  Appetizers
//
//  Created by ☕️ Gabo.montero on 5/12/24.
//

import SwiftUI

enum FormTextField {
    case firstName, lastName, email
}

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    
    // .. keep track of current focused field
    @FocusState private var focusedTextField: FormTextField?
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) { //⚠️
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName } // .. move next field
                        .submitLabel(.next) // .. chenage return button text
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email } // .. move next field
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil } // .. we're done
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .autocapitalization(.none) //⚠️
                        .disableAutocorrection(true) //⚠️
                    
                    DatePicker(
                        "Birthday",
                        selection: $viewModel.user.birthData,
                        in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo,
                        displayedComponents: .date
                    )
                    
                    HStack {
                        Button {
                            viewModel.saveChanges()
                        } label: {
                            Text("Save Changes")
                        }
                    }
                }
                
                Section(header: Text("Requests")) { //⚠️
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary)) //⚠️
            }
            .navigationTitle("⚙️ Account")
            .alert(item: $viewModel.alertItem) { alertItem in //⚠️
                Alert(
                    title: alertItem.title,
                    message: alertItem.message,
                    dismissButton: alertItem.dismissButton
                )
            }
            .toolbar { // .. we declare a toolbar
                ToolbarItemGroup(placement: .keyboard) { // .. and place the item within the keyboard
                    // .. and we define the button to dismiss the keyboard by hand
                    Button("Dismiss") {
                        focusedTextField = nil
                    }
                }
            }
        }
        .onAppear {
            viewModel.retreiveUser()
        }
    }
}

#Preview {
    AccountView()
}
