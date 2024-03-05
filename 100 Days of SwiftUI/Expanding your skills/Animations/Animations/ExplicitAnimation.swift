//
//  ExplicitAnimation.swift
//  Animations
//
//  Created by ☕️ Gabo.montero on 3/4/24.
//

import SwiftUI

// .. explicit asking SwiftUI:
// .. to animate changes ocurring as the result of a state change

struct ExplicitAnimation: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            // .. - explicit animation -
            // .. will ensure any changes resulting from the new state will automatically be animated
            // .. - can be given an animation parameter, using all the same animations -
            withAnimation(.spring(duration: 2, bounce: 0.5)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect( // .. to make it spin around with a 3D effect
            .degrees(animationAmount),
            // X axis (horizontally) - sping forwards and backwards
            // Y axis (vertically) - spin left and right
            // Z axis (depth) - rotate left and right
            axis: (x: 0, y: 1, z: 0)
        )
    }
}

#Preview {
    ExplicitAnimation()
}
