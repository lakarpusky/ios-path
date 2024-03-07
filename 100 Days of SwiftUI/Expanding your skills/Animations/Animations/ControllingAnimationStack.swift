//
//  ControllingAnimationStack.swift
//  Animations
//
//  Created by ☕️ Gabo.montero on 3/6/24.
//

import SwiftUI

struct ControllingAnimationStack: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me 1") {
            enabled.toggle()
        }
        .background(enabled ? .blue : .red)
        .frame(width: 200, height: 200)
        .foregroundStyle(.white)
        .animation(.default, value: enabled)
        
        Button("Tap Me 2") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .red : .blue)
        .animation(nil, value: enabled)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
        
        // .. we can apply an "animation()" modifier to a view
        // .. in order to have it implicitly animate changes
    }
}

#Preview {
    ControllingAnimationStack()
}
