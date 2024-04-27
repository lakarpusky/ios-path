//
//  GeometryReaderResizingImages.swift
//  LayoutAndGeometry
//
//  Created by ☕️ Gabo.montero on 4/27/24.
//

import SwiftUI

struct GeometryReaderResizingImages: View {
    var body: some View {
        /**
         * `GeometryReader`: automatically expands to take up available sapce in your layout,
         *  then positons its own content aligned to the top-left corner
         *  ---
         * `proxy` lets us query the environment:
         * - how big is the container?
         * - what position is our view?
         * - are there any safe area insets?
         */
        GeometryReader { proxy in
            Image(.lakarpusky)
                .resizable()
                .scaledToFit()
                .frame(
                    width: proxy.size.width * 0.8 // 80% the width of the screen
                    //height: 300 // a fixed height of 300 or remove it
                )
        }
        
        HStack {
            Text("IMPORTANT")
                .frame(width: 200)
                .background(.blue)
            
//            Image(.lakarpusky)
//                .resizable()
//                .scaledToFit()
//                .containerRelativeFrame(.horizontal) { size, axis in
//                    size * 0.8
//                }
            
            GeometryReader { proxy in
                Image(.lakarpusky)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width * 0.8)
                // .. to center a view inside a (GeometryReader),
                // .. add a second frame that makes it fill the full space of the container
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
    }
}

#Preview {
    GeometryReaderResizingImages()
}
