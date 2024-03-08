//
//  UsingStateWithClasses.swift
//  iExpense
//
//  Created by ☕️ Gabo.montero on 3/7/24.
//

import SwiftUI

struct User3 {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct UsingStateWithClasses: View {
    @State private var user = User3()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
        .padding()
    }
}

#Preview {
    UsingStateWithClasses()
}
