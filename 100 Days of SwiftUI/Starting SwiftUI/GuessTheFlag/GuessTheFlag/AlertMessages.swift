//
//  AlertMessages.swift
//  GuessTheFlag
//
//  Created by ☕️ Gabo.montero on 2/24/24.
//

import SwiftUI

struct AlertMessages: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        // .. attachs the alert to the button,
        // .. but it doesn't matter where the "alert()" modifier is used
        .alert("Important message", isPresented: $showingAlert) {
            // .. good place to add roles to make sure it's clear wath each button does
            Button("Delete", role: .destructive) {}
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Please read this.")
        }
    }
}

#Preview {
    AlertMessages()
}
