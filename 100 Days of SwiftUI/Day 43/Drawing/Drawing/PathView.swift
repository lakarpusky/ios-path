//
//  PathView.swift
//  Drawing
//
//  Created by ☕️ Gabo.montero on 10/26/23.
//

import SwiftUI

struct PathView: View {
    var body: some View {
        //.. for drawing custom shapes
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            //path.closeSubpath() // ask SwiftUI to close the subpath
        }
        .fill(.blue) // coloring our path
        //.stroke(.orange, lineWidth: 10) // draw around the path
        
        //.. join and rounded shapes
        //.. doesn't solve the problem of fixed coordinates
        .stroke(.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

#Preview {
    PathView()
}
