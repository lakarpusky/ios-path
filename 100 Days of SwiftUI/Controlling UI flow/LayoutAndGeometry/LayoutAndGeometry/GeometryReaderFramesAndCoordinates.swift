//
//  GeometryReaderFramesAndCoordinates.swift
//  LayoutAndGeometry
//
//  Created by ☕️ Gabo.montero on 4/27/24.
//

import SwiftUI

struct GeoReaderBehavior: View {
    var body: some View {
        VStack {
            /**
             * What `GeometryReader` does is:
             * - let us read the size that was proposed by the parent
             * - then use that to manipulate our view
             *
             * The `proxy` parameter that comes in is a `GeometryProxy`, and it contains:
             * - the proposed size
             * - any safe are insets that have been applied
             * - plus a method for reading frame values
             */
            GeometryReader { proxy in
                Text("Hello, World!") // .. regardless of its content
                    .frame(width: proxy.size.width * 0.9) // .. to make the view have 90% of all available width
                    .background(.red)
            } // .. as side effect: it will expand to take up more space as needed.
            .background(.green)
            
            Text("More text")
                .background(.blue)
        }
    }
}

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { proxy in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print(
                            """
                            Global center:
                            \(proxy.frame(in: .global).midX) x
                            \(proxy.frame(in: .global).midY)
                            """
                        )
                        print(
                            """
                            Custom center:
                            \(proxy.frame(in: .named("Custom")).midX) x
                            \(proxy.frame(in: .named("Custom")).midY)
                            """
                        )
                        print(
                            """
                            Local center: 
                            \(proxy.frame(in: .local).midX) x
                            \(proxy.frame(in: .local).midY)
                            """
                        )
                    }
            }
            .background(.orange)
            Text("Right")
        }
    }
}

struct GeometryReaderFramesAndCoordinates: View {
    var body: some View {
        //GeoReaderBehavior()
        
        /**
         * Reading the frame of a view, `GeometryProxy` provides a `frame(in:)` method
         * ---
         * The concept of a `frame` includes X and Y coordiantes:
         * - do you want the view's absolute X and Y
         * - or their X and Y coordinates compared to their parent
         * ---
         * SwiftUI calls these options `coordiante spaces`, and those two in particular are called:
         * - `global sapce` measuring our view's frame relative to the whole screen
         * - `local space` measuring our view's frame relative to its parent
         * - `custom space`measuring our view's frame relative to some other view
         */
        OuterView()
            .background(.red)
        // .. we can also create custom coordinate spaces by attaching (coordinateSpace) modifier
        // .. any children can then read its frame relative to that coordinate space.
            .coordinateSpace(name: "Custom")
    }
}

#Preview {
    GeometryReaderFramesAndCoordinates()
}
