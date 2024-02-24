//
//  UsingStacks.swift
//  GuessTheFlag
//
//  Created by ☕️ Gabo.montero on 2/24/24.
//

import SwiftUI

// .. allow us to specify:
// .. - how much space between the views
// .. - an alignment: left, right, or center

struct UsingStacks: View {
    var body: some View {
        // .. vertical stack
        VStack(alignment: .trailing, spacing: 20) {
            Image(systemName: "person.circle")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Hello, VStack!")
            Spacer() // .. to push the contents to one side
        }
        .padding()
        
        VStack(alignment: .center, spacing: 30) {
            HStack {
                Text("R01")
                Text("R02")
                Text("R03")
            }
            HStack {
                Text("R11")
                Text("R12")
                Text("R13")
            }
            HStack {
                Text("R21")
                Text("R22")
                Text("R23")
            }
            Spacer()
        }
        .fontWeight(.bold)
        
        // .. horizontal stack
        HStack(spacing: 20) {
            Text("Hello, HStack!")
            Text("This is inside a stack")
        }
        
        // .. arranging things by depth - it makes views that overlap
        // .. render constent from top to bottom, back to front
        ZStack(alignment: .top) {
            Text("Hello, ZStack!")
            Text("This is inside a stack")
        }
    }
}

#Preview {
    UsingStacks()
}
