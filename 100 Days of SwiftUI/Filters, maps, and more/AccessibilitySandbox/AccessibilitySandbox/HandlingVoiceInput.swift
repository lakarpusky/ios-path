//
//  HandlingVoiceInput.swift
//  AccessibilitySandbox
//
//  Created by ☕️ Gabo.montero on 4/7/24.
//

import SwiftUI

// .. the goal is to help the user activate your controls
// .. using whatever seems natural to them

struct HandlingVoiceInput: View {
    var body: some View {
        Button("Tap Me") {
            print("Button tapped")
        }
        
        Button("John Fitzgerald Kennedy") {
            print("Button tapped")
        }
        // .. so the user can trigger it in a variety of ways,
        // .. so, to trigger the button with three different phrases
        .accessibilityInputLabels(["John Fitzgerald Kennedy", "Kennedy", "JFK"])
    }
}

#Preview {
    HandlingVoiceInput()
}
