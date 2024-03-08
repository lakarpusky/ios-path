//
//  SharingStateWithObservable.swift
//  iExpense
//
//  Created by ☕️ Gabo.montero on 3/7/24.
//

import SwiftUI

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct SharingStateWithObservable: View {
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            VStack {
                TextField("First name", text: $user.firstName)
                TextField("Last name", text: $user.lastName)
            }
        }
        .padding()
    }
}

#Preview {
    SharingStateWithObservable()
}
