//
//  GroupsTransparentLayoutContainers.swift
//  SnowSeeker
//
//  Created by ☕️ Gabo.montero on 5/2/24.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        // .. to add modifiers to multiple views without changing their layout, or
        // .. send back multiple views without using (@ViewBuilder)
        Group {
            Text("Name: Gabo")
            Text("Country: Cuba")
            Text("Pets: None")
        }
        .font(.title)
    }
}

struct GroupsTransparentLayoutContainers: View {
     // .. to track the current size class
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State private var layoutVertically = false
    
    var body: some View {
        Button {
            layoutVertically.toggle()
        } label: {
            if layoutVertically {
                VStack {
                    UserView()
                }
            } else {
                HStack {
                    UserView()
                }
            }
        }
        
        /**
         * we have only two size classes
         * - `horizontal`: `compact`
         * - `vertically`: `regular`
         * that covers all screen sizes
         * so we can switch between `VStack` and `HStack` automatically
         */
        if horizontalSizeClass == .compact {
            VStack { UserView() }
            // .. when you have only one view inside and it doesn't take any parameters
            VStack(content: UserView.init)
        } else {
            HStack { UserView() }
            // .. when you have only one view inside and it doesn't take any parameters
            HStack(content: UserView.init)
        }
        
        // .. can provide it with several different layouts
        // .. it will automatically try each one in order until if finds one that can be fitted into the available space
        ViewThatFits {
            // .. will attempt to show the rectangle by default
            Rectangle() // .. but if that can't fit into the available space
                .frame(width: 200, height: 200)
            
            // .. it will show the circle instead
            Circle()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    GroupsTransparentLayoutContainers()
}
