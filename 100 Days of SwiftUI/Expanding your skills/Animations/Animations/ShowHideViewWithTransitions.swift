//
//  ShowHideViewWithTransitions.swift
//  Animations
//
//  Created by ☕️ Gabo.montero on 3/7/24.
//

import SwiftUI

struct ShowHideViewWithTransitions: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                // .. we can get default view transition by wrapping the sate change
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    //.transition(.scale) // .. scale up and down as it s shown
                    // .. let us use one transition when the view is being shown and another when it's disappearing
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

#Preview {
    ShowHideViewWithTransitions()
}
