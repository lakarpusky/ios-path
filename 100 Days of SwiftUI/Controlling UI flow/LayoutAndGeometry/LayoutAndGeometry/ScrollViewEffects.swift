//
//  ScrollViewEffects.swift
//  LayoutAndGeometry
//
//  Created by ☕️ Gabo.montero on 4/27/24.
//

import SwiftUI

struct ScrollViewEffects: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { num in
                    Text("Number \(num)")
                        .font(.largeTitle)
                        .padding()
                        .background(.orange)
                        .frame(width: 200, height: 200)
                    /**
                     * `visualEffect()`
                     * - lets us apply effects that change the way something looks
                     * - we can't do anything that affects the actual layout position or frame of a view.
                     *
                     * we pass it a closure to run, and we'll be given:
                     * - the `content` we're modifying
                     * - as well as a `GeometryProxy` for it
                     */
                        .visualEffect { content, proxy in
                            content
                                .rotation3DEffect(
                                    .degrees(-proxy.frame(in: .global).minX) / 8,
                                    axis: (x: 0, y: 1, z: 0)
                                )
                        }
                }
            }
            // .. to make each view inside this a scroll target
            .scrollTargetLayout() // - something that is considered imortant when it comes to scrolling around -
        }
        // .. make this scroll view more smoothly between all scroll targets
        .scrollTargetBehavior(.viewAligned) // .. which we just defined as being every view inside our (HStack)
    }
}

#Preview {
    ScrollViewEffects()
}
