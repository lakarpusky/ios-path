//
//  DisablingUserInteractivity.swift
//  Flashzilla
//
//  Created by ☕️ Gabo.montero on 4/20/24.
//

import SwiftUI

struct DisablingUserInteractivity: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.green)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }
            
            Circle()
                .fill(.blue)
                .frame(width: 300, height: 200)
                // .. by default the tappable shape for a circle is a circle of the same size, but
                .contentShape(.rect) // .. you can specify a different shape instead
                .onTapGesture {
                    print("Circle tapped!")
                }
                // .. when this is attached to a view set to false,
                //.allowsHitTesting(false) // .. the view isn't even considered tappable
        }
        
        VStack {
            Text("Hello")
            // .. by default won't trigger actions when a stack spacer is tapped
            Spacer().frame(height: 100)
            Text("World")
        }
        // .. then the whole area for the stack becomes tappable,
        .contentShape(.rect) // .. including the spacer
        .onTapGesture {
            print("vstack tapped!")
        }
    }
}

#Preview {
    DisablingUserInteractivity()
}
