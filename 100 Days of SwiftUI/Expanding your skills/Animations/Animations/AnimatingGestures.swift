//
//  AnimatingGestures.swift
//  Animations
//
//  Created by ☕️ Gabo.montero on 3/6/24.
//

import SwiftUI

struct AnimatingGestures: View {
    // .. to move around the screen based on the location of our finger
    @State private var dragAmount = CGSize.zero
    @State private var enabled = false
    
    let letters = Array("Hello SiwftUI")
    
    var body: some View {
        // .. a card that we can drag around the screen,
        // .. but when we let go it snaps back into its original location
        LinearGradient(
            colors: [.yellow, .red],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .frame(width: 300, height: 200)
        .clipShape(.rect(cornerRadius: 10))
        // .. we want to use that size to influence the card's position on-screen
        // .. let us adjust the X and Y coordinate of a view without moving coincidence
        .offset(dragAmount)
        .gesture(
            DragGesture()
                // .. let us run whenever the user moves their finger
                .onChanged { dragAmount = $0.translation }
                // .. let us run when the user lifts their finger off the screen, ending the drag
                .onEnded { _ in
                    // .. explicit animation to animate just the release
                    withAnimation(.bouncy) {
                        dragAmount = .zero
                    }
                }
        )
        // .. implicit animation that will animate the drag and the release
        //.animation(.bouncy, value: dragAmount)
        
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .green : .blue)
                    .foregroundStyle(.white)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
        
    }
}

#Preview {
    AnimatingGestures()
}
