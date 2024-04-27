//
//  AbsolutePositioningViews.swift
//  LayoutAndGeometry
//
//  Created by ☕️ Gabo.montero on 4/27/24.
//

import SwiftUI

struct AbslutePosition: View {
    var body: some View {
        Text("Absolute position")
        // .. when we use it we get back a new view that takes up all available space,
        // .. so it can position its child at the correct location.
            .position(x: 100, y: 100)
            .background(.yellow)
    }
}

struct RelativePosition: View {
    var body: some View {
        Text("Relative position")
        // .. we're changing the location where a view should be rendered
        // .. without actually changing its underlying geometry.
            .offset(x: 100, y: 100)
            .background(.red) // .. it uses the original position of the text, - not its offset -
    }
}

struct AbsolutePositioningViews: View {
    var body: some View {
        //AbslutePosition()
        RelativePosition()
    }
}

#Preview {
    AbsolutePositioningViews()
}
