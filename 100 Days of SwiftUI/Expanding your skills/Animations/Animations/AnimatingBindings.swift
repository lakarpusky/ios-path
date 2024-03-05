//
//  AnimatingBindings.swift
//  Animations
//
//  Created by ☕️ Gabo.montero on 3/4/24.
//

import SwiftUI

struct AnimatingBindings: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        print(animationAmount)
        
        return VStack {
            Stepper(
                "Scale amunt",
                // .. "animation()" can be applied to any binding
                // .. - which causes the value to animate between its current and new value -
                value: $animationAmount.animation(
                    // .. with this variant of the animation modifier,
                    // .. we don't need to specify wich value we're watching for changes
                    // .. it's literally attached to the value it should watch
                    .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
                ), // .. automatically animate its changes
                in: 1...10
            )
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
        }
    }
}

#Preview {
    AnimatingBindings()
}
