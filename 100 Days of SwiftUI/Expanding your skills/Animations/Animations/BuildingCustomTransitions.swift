//
//  BuildingCustomTransitions.swift
//  Animations
//
//  Created by ☕️ Gabo.montero on 3/7/24.
//

import SwiftUI

// .. causes a new slice to rotate in from its top-left corner
// .. - causes our view to rotate in from one corner, without escaping the bounds it's supposed to be in -
struct CornerRotateModifier: ViewModifier {
    let amount: Double // .. to control how much rotation should be applied
    let anchor: UnitPoint // .. to control where the rotation should take place
    
    func body(content: Content) -> some View {
        content
            // .. give us the ability to control the anchor point of the rotation
            // .. - which part of the view shpuld be fixed in place as the center of the rotation -
            .rotationEffect(.degrees(amount), anchor: anchor) // .. let us rotate a view in 2D sapce
            .clipped() // .. stops the view from being drawn outside of its rectangular space
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct BuildingCustomTransitions: View {
    @State private var isShowingRed = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot) // .. we now attach the pivot animation to any view
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

#Preview {
    BuildingCustomTransitions()
}
