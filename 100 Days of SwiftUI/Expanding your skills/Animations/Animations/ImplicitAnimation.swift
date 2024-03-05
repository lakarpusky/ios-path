//
//  ImplicitAnimation.swift
//  Animations
//
//  Created by ☕️ Gabo.montero on 3/4/24.
//

import SwiftUI

// implicit animations always need to watch a particular value
// otherwise animations would be triggered for every small change

struct ImplicitAnimation: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1 // .. change the scale effect
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount) // .. to get bigger every time it's tapped
        .blur(radius: (animationAmount - 1) * 3) // .. add a gaussian blur effect with special radius
        .animation(.default, value: animationAmount) // .. to create an implicit animation
    }
}

#Preview {
    ImplicitAnimation()
}
