//
//  CustomizingAnimation.swift
//  Animations
//
//  Created by ☕️ Gabo.montero on 3/4/24.
//

import SwiftUI

struct AButton: View {
    var text: String
    var color: Color
    var action: () -> Void
    
    var body: some View {
        Button("on Appear", action: action)
            .padding(50)
            .background(color)
            .foregroundStyle(.white)
            .clipShape(.circle)
    }
}

struct CustomizingAnimation: View {
    @State private var linearAmount = 1.0
    @State private var springAmount = 1.0
    @State private var easeInOutAmount = 1.0
    @State private var onAppearAmount = 1.0
    
    var body: some View {
        AButton(text: "Linear", color: .yellow) {
            linearAmount += 1
        }
        .scaleEffect(linearAmount)
        .animation(.linear, value: linearAmount) // .. to make the animation move at a constant speed from start to finish
        
        Spacer()
        
        AButton(text: "Spring", color: .red) {
            springAmount += 1
        }
        .scaleEffect(springAmount)
        // .. iOS chooses spring animations by default
        // .. - can control how long should take to complete -
        .animation(.spring(duration: 1, bounce: 0.9), value: springAmount) // .. makes our button scale up quickly then bounce a lot
        
        Spacer()
        
        AButton(text: "Ease-InOut", color: .green) {
            easeInOutAmount += 1
        }
        .scaleEffect(easeInOutAmount)
        // .. with duration specified as a number of seconds
        // .. - "ease-in-out" animation that lasts for two seconds -
        .animation(
            // .. an instance of an "Animation" struct
            // .. so, we can attach modifiers directly to the animation
            .easeInOut(duration: 1)
                //.delay(1)
                //.repeatCount(3, autoreverses: true) // .. repeat the animation "3" times
                .repeatForever(autoreverses: true),
            value: easeInOutAmount
        )
        
        Spacer()
        
        AButton(text: "on-Appear", color: .blue) { }
            // .. to make a sort of pulsating circle around the button
            .overlay( // .. create a view at the same size and position
                Circle()
                    .stroke(.orange)
                    .scaleEffect(onAppearAmount)
                    .opacity(2 - onAppearAmount)
                    .animation(
                        .easeOut(duration: 1)
                            .repeatForever(autoreverses: false), // (2*) .. and continue animating for the life of the view
                        value: onAppearAmount
                    )
            )
            .onAppear { // .. to make animations that start immediately (1*)
                onAppearAmount = 2
            }
    }
}

#Preview {
    CustomizingAnimation()
}
