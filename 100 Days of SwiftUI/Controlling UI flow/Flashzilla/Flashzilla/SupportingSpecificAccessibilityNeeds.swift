//
//  SupportingSpecificAccessibilityNeeds.swift
//  Flashzilla
//
//  Created by ☕️ Gabo.montero on 4/21/24.
//

import SwiftUI

struct SupportingSpecificAccessibilityNeeds: View {
    // .. helpful for the (1 in 12 men) who have color blindness
    // .. Accessibility > Display & Text Size > Differentiate Without Color
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    
    // .. reduce motion: Accessibility > Motion > Reduce Motion
    // .. limit the amount of animation that causes movement on screen
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    // .. reduce transparency
    // .. should reduce the amount of blur and translucency used in their designs to make doubly sure everything is clear
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    
    @State private var scale = 1.0
    @State private var scale2 = 1.0
    
    var body: some View {
        HStack {
            if differentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }
            
            Text("Differentiate Without Color")
        }
        .padding()
        .background(differentiateWithoutColor ? .black : .green)
        .foregroundStyle(.white)
        .clipShape(.capsule)
        
        Button("Reduce Motion") {
            if reduceMotion {
                scale *= 1.5
            } else {
                withAnimation {
                    scale *= 1.5
                }
            }
        }
        .scaleEffect(scale)
        .buttonStyle(.bordered)
        .tint(.blue)
        
        Button("Reduce Motion With Optional Animation") {
            // .. using this approach you don't need to repeat your animation code every time
            withOptionalAnimation {
                scale2 *= 1.5
            }
        }
        .scaleEffect(scale2)
        .buttonStyle(.bordered)
        .tint(.orange)
        
        Text("Reduce Transparency")
            .padding()
            .background(reduceTransparency ? .black : .black.opacity(0.5))
            .foregroundStyle(.white)
            .clipShape(.capsule)
    }
    
    // .. we can add a little wrapper function around (withAnimation)
    // .. that uses UIKit's (UIAccessibility) data directly, allowing us to bypass animation automatically.
    func withOptionalAnimation<Result>(
        _ animation: Animation? = .default,
        _ body: () throws -> Result
    ) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
}

#Preview {
    SupportingSpecificAccessibilityNeeds()
}
