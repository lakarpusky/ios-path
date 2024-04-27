//
//  AlignmentGuides.swift
//  LayoutAndGeometry
//
//  Created by ☕️ Gabo.montero on 4/27/24.
//

import SwiftUI

struct AlignmentGuides: View {
    var body: some View {
        Text("Live long and prosper")
            .frame(width: 200, height: 100, alignment: .topLeading) // .. top-left corner
            .offset(x: 20, y: 20) // .. to move the text around inside the frame
            .border(.red, width: 1)
        
        // .. to be aligned on a single unified baseline, regardless of their font
        HStack(alignment: .lastTextBaseline) {
            Text("Live").font(.caption)
            Text("long")
            Text("and").font(.title)
            Text("prosper").font(.largeTitle)
        }
        .border(.red, width: 1)
        
        // .. we can customize what (alignment) means for each individual view
        VStack(alignment: .leading) {
            Text("Hello, world!")
            Text("This is a longer line of text")
        }
        .background(.orange)
        .frame(width: 250, height: 100)
        .background(.green)
        
        /**
         * What if we wanted to make one view have a custom alignment?
         * --
         * SwiftUI provide us with the `alignmentGuide()` modifier for just this purpose
         *
         * Takes two parameters:
         * - the guide we want to change, and
         * - a closure that returns a new alignment.
         *
         * The closure is given a `ViewDimensions` object that contrins the width and height of its view,
         * along with the ability to read its varioes edges.
         */
        
        // .. by default the (.leading) guide for a view is its leading alignment guide
        VStack(alignment: .leading) {
            Text("Hello, world!")
                .alignmentGuide(.leading) { d in d[.leading] } // .. its equivalent to this
            Text("So that's for?")
                // .. we could rewrite that alignment guide
                .alignmentGuide(.leading) { d in d[.trailing] } // .. to use the view's trailling edge for its leading alignment guide
            Text("This is a longer line of text")
        }
        .padding()
        .border(.red, width: 1)
        
        VStack(alignment: .leading) {
            ForEach(0..<10) { position in
                Text("Number \(position)")
                    // .. you can omit the view's doimension (_) and send back a hard-coded number,
                    // .. or create some other calculation.
                    .alignmentGuide(.leading) { _ in Double(position) * -10 }
            }
        }
        .padding()
        .background(.yellow)
        .frame(width: 300, height: 300)
        .background(.blue)
        
        // .. for complete control over your alignment guides
        // .. you need to create a custom alignment guide.
    }
}

#Preview {
    AlignmentGuides()
}
