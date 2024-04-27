//
//  GeometryReaderScrollViewEffects.swift
//  LayoutAndGeometry
//
//  Created by ☕️ Gabo.montero on 4/27/24.
//

import SwiftUI

struct SpinningHelixEffect: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader { fullView in // .. to get the size of the main view
            ScrollView {
                ForEach(0..<50) { index in // .. creating 50 text views in a vertical scroll view
                    GeometryReader { proxy in
                        Text("Row $\(index)")
                            .font(.title)
                            // .. each of which has an infinite maximum width so they take up all the screen space
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            // .. apply a 3D rotation effect based on their own position
                            // .. apply a helix-style spinning effect
                            .rotation3DEffect(
                                // .. substracts half the height of the main view
                                .degrees(proxy.frame(in: .global).minY - fullView.size.width / 2) / 5,
                                axis: (x: 0, y: 1, z: 0)
                            )
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct CoverFlowEffect: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { num in
                    GeometryReader { proxy in
                        Text("Number \(num)")
                            .font(.largeTitle)
                            .padding()
                            .background(.red)
                            .rotation3DEffect(
                                .degrees(-proxy.frame(in: .global).minX) / 8,
                                axis: (x: 0, y: 1, z: 0)
                            )
                            .frame(width: 200, height: 200)
                    }
                    .frame(width: 200, height: 200)
                }
            }
        }
    }
}

struct GeometryReaderScrollViewEffects: View {
    var body: some View {
        //SpinningHelixEffect()
        CoverFlowEffect()
    }
}

#Preview {
    GeometryReaderScrollViewEffects()
}
