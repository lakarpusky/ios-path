//
//  ListCustomRowSwipeActions.swift
//  HotProspects
//
//  Created by ☕️ Gabo.montero on 4/17/24.
//

import SwiftUI

// .. swipe actions are by their nature hidden to the user by default,
// .. so it's important not to hide important functionality in them.

// .. Cmd+L in the simulator to lock the screen

struct ListCustomRowSwipeActions: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                // .. let us register one or more buttons on one or both sides
                .swipeActions {
                    // .. by default will be placed on the right edge of the row,
                    // .. and won't have any color,
                    Button( // .. so this will show a single gray button
                        "Send message",
                        systemImage: "message",
                        role: .destructive // .. can customize the color by attaching a ronle
                    ) {
                        print("Hi")
                    }
                }
                // .. can customize the edge where buttons are placed by providing an (edge) parameter
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("Pinning")
                    }
                    .tint(.orange) // .. can customize the color by adding a (tint) modifier
                }
        }
    }
}

#Preview {
    ListCustomRowSwipeActions()
}
