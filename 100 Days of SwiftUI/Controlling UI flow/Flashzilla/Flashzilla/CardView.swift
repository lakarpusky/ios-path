//
//  CardView.swift
//  Flashzilla
//
//  Created by ☕️ Gabo.montero on 4/24/24.
//

import SwiftUI

struct CardView: View {
    // .. to track whether we should be using color for this purpose or not
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero // .. to track how far the user has dragged
    
    let card: Card
    var removal: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    accessibilityDifferentiateWithoutColor
                        ? .white
                        : .white
                            .opacity(1 - Double(abs(offset.width / 50)))
                )
                .background(
                    accessibilityDifferentiateWithoutColor
                        ? nil
                        : RoundedRectangle(cornerRadius: 25)
                            .fill(offset.width > 0 ? .green : .red)
                )
                .shadow(radius: 10)
            
            VStack {
                if accessibilityVoiceOverEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                    
                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        /**
         * `offset.width` will contain how far the user dragged our card, but
         * we don't want to use that for our rotation because the card would spin too fast
         * so we use `1/5th` of the drag amount
         */
        .rotationEffect(.degrees(offset.width / 5.0))
        /**
         * to apply our movement
         * --
         * so the card slides relative to the horizontal drag amount
         * we're not going to use the original value of `offset.with` because
         * it would require the user to drag a long way to get any meaningful results, so
         * instead we're going to `multiply it by 5` so the cards can be swiped away with small gestures
         */
        .offset(x: offset.width * 5)
        /**
         * we are going to take `1/50th` of the drag amount, so the card doesn't fade out too quickly
         * we don't care whether they have moved to the left `(negative number)` or to the right `(positive number)`, so we'll put our value throught the `abs()` function
         * we then use this result to substract from `2`: intentional, because it allows the card to stay opaque while being dragged just a little
         */
        .opacity(2 - Double(abs(offset.width / 50)))
        // .. to make it clear that our cards are tappable buttons
        .accessibilityAddTraits(.isButton)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    // .. to see where the user has dragged to
                    offset = gesture.translation
                }
                .onEnded { _ in
                    // .. checking whether the user moved it more than 100 points in either
                    // .. direction so we can prepare to remove the card.
                    if abs(offset.width) > 100 {
                        removal?()
                    } else {
                        offset = .zero
                    }
                }
        )
        .onTapGesture {
            isShowingAnswer.toggle()
        }
        .animation(.bouncy, value: offset)
    }
}

#Preview {
    CardView(card: .example)
}
