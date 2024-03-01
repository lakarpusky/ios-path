//
//  KeyPoints.swift
//  RockPaperScissors
//
//  Created by ☕️ Gabo.montero on 2/25/24.
//

import SwiftUI

// .. want to react to changes in a binding
// .. we get complete control over how they work

// .. working with bindings
struct SomeContentView: View {
    // .. simplest form of custom binding,
    // .. stores the value away in another "@State" property and reads that back
    @State private var selection = 0
    
    // .. more advanced binding
    // .. - form with three toggle switches -
    // .. - does the user agree to the terms and conditions,
    // ..   agree to the privacy policy, and agree to get emails about shipping
    @State private var agreedToTerms = false
    @State private var agreedPrivacyPolicy = false
    @State private var agreedToEmails = false
    
    var body: some View {
        let binding = Binding(
            get: { selection },
            set: { selection = $0 }
        )
        
        // .. to do them all at once
        // .. would be true if all were true, but if changed then it would update them all
        let agreeToAll = Binding<Bool>(
            get: {
                agreedToTerms && agreedPrivacyPolicy && agreedToEmails
            },
            set: {
                agreedToTerms = $0
                agreedPrivacyPolicy = $0
                agreedToEmails = $0
            }
        )
        
        VStack {
            Picker("Select a number", selection: binding) {
                ForEach(0..<3) {
                    Text("Item \($0)")
                }
            }
            .pickerStyle(.segmented)
            
            Toggle("Agree to terms", isOn: $agreedToTerms)
            Toggle("Agree to Privacy Policy", isOn: $agreedPrivacyPolicy)
            Toggle("Agree to Receive shiping emails", isOn: $agreedToEmails)
            Toggle("Agree to all", isOn: agreeToAll)
        }
    }
}

struct KeyPoints: View {
    let agents = ["Cyril", "Lana", "Pam", "Sterling"]
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                // .. working with "ForEach"
                ForEach(0 ..< 5) { number in
                    Text("Row \(number)")
                }
            }
            
            HStack {
                ForEach(agents, id: \.self) {
                    Text($0)
                }
            }
            
            SomeContentView()
        }
        .padding()
    }
}

#Preview {
    KeyPoints()
}
