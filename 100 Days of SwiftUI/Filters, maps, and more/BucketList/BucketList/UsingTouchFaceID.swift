//
//  UsingTouchFaceID.swift
//  BucketList
//
//  Created by ☕️ Gabo.montero on 3/31/24.
//

import SwiftUI
// .1. step
// - select the app name
// - go to "Info" tab
// - right click on an existing key, then choose "Add Row"
// - find "Privacy - Face ID Usage Description" and
// - give it the value "We need to unlock your data"

// .2. step
import LocalAuthentication

struct UsingTouchFaceID: View {
    @State private var isUnlocked = false // .. whether the app is showing its protected data or not
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate) // .. to trigger authentication
    }
    
    func authenticate() {
        let context = LAContext() // .. allows us to query biometric status and perform the authentication check
        var error: NSError? // .. representing errors that occur at runtime in (Objective-C)
        
        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            // .. we need to be able to pass that into the function and 
            // .. have it changed inside the function rather than returning a new value,
            error: &error // so we need to mark this behavior specially by using "&"
        ) {
            // it's possible so go ahead and use it
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,
                localizedReason: reason
            ) { success, authenticationError in
                // authentication has now completed
                if success {
                    // authenticated successfully
                    isUnlocked = true
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
}

#Preview {
    UsingTouchFaceID()
}
