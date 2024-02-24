//
//  Gradients.swift
//  GuessTheFlag
//
//  Created by ☕️ Gabo.montero on 2/24/24.
//

import SwiftUI

// .. gradients are made up of several components:
// .. - an array of colors to show
// .. - size and direction information
// .. - the type of gradient to use

struct Gradients: View {
    var body: some View {
        // .. 1. linear gradient
        LinearGradient(
            colors: [.white, .black],
            startPoint: .top,
            endPoint: .bottom
        )
        
        // .. 1.1 linear gradient with stops
        // .. - let us specify both a color and how far along the gradient the color should be used
        // .. example:
        // .. - white from the start up to 45%
        // .. - black from 55% of the available sapce onwards
        LinearGradient(
            stops: [
                // .. swift knows we're creating gradient stops here,
                // .. so we can just write ".init" rather than "Gradient.Stop"
                .init(color: .white, location: 0.45),
                .init(color: .black, location: 0.55),
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        
        // .. 2. radial gradient
        RadialGradient(
            colors: [.blue, .black],
            center: .center,
            startRadius: 20,
            endRadius: 200
        )
        
        // .. 3. angular, conic, or conical gradient
        // .. cycles colors around a circle rather than radiating outward
        AngularGradient(
            colors: [.red, .yellow, .blue, .green, .purple],
            center: .center
        )
        
        // .. 4. background or foreground styles
        // .. - adding ".gradient" after any color
        Text("Your content")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.white)
            .background(.red.gradient)
    }
}

#Preview {
    Gradients()
}
