//
//  ReadingValueControls.swift
//  AccessibilitySandbox
//
//  Created by ☕️ Gabo.montero on 4/5/24.
//

import SwiftUI

struct ReadingValueControls: View {
    @State private var value = 10
    
    var body: some View {
        VStack {
            Text("Vaue: \(value)")
            
            Button("Increment") {
                value += 1
            }
            
            Button("Decrement") {
                value -= 1
            }
        }
        .accessibilityElement() // .. default (.ingore)
        .accessibilityLabel("Value")
        .accessibilityValue(String(value)) // .. to separate a control's value from its label,
        // .. but also specify custom swipe actions
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                value += 1
            case .decrement:
                value -= 1
            default:
                print("Not handled.")
            }
        }
    }
}

#Preview {
    ReadingValueControls()
}
