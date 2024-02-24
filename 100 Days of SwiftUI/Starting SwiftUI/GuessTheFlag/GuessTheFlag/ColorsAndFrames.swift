//
//  ColorsAndFrames.swift
//  GuessTheFlag
//
//  Created by ☕️ Gabo.montero on 2/24/24.
//

import SwiftUI

struct ColorsAndFrames: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.orange
                Color.green
            }
            
            // .. automatically take up all the space available
            Color.yellow // .. to fill the whole area behind the text
                .frame(width: 200, height: 200) // .. ask for specific sizes
            
            // .. frosted glass effect
            Text("Your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial) // .. also accept materials
        }
        .ignoresSafeArea() // .. if you want your content to go under safe area
    }
}

#Preview {
    ColorsAndFrames()
}
