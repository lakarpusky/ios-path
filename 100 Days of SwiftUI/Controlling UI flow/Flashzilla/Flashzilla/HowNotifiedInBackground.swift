//
//  HowNotifiedInBackground.swift
//  Flashzilla
//
//  Created by ☕️ Gabo.montero on 4/21/24.
//

import SwiftUI

struct HowNotifiedInBackground: View {
    // 1. to watch an environment value called (scenePhase)
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            // 2. to watch for the scene phase chaning
            .onChange(of: scenePhase) { oldPhase, newPhase in
                // 3. responding to the new scene phase somehow
                
                // .. running right now, visible to the user
                if newPhase == .active {
                    print("Active")
                // .. running and might be visible to the user, but isn't able to access them
                // .. swiping down to partially reveal the control center the the app underneath is cansidered inactive
                } else if newPhase == .inactive {
                    print("Inactive")
                // .. are not visible to the user
                // .. they might be terminated at some point in the future
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

#Preview {
    HowNotifiedInBackground()
}
