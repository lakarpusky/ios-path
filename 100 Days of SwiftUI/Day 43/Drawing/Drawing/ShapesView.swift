//
//  ShapesView.swift
//  Drawing
//
//  Created by ☕️ Gabo.montero on 10/26/23.
//

import SwiftUI

struct Triangle: Shape {
    
    //..have the flexibility of drawing space and can also accept parameters
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

// 1. conform to "InsettableShape"
struct Arc: InsettableShape {
    
    // 2. able to use .strokeBorder()
    var insetAmount = 0.0
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    // 3..
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        
        // 4. "amount" parameter should be applied to all edges, we should use it to reduce the radius
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: rect.width / 2 - insetAmount,
            startAngle: modifiedStart,
            endAngle: modifiedEnd,
            clockwise: !clockwise
        )
        
        return path
    }
}

struct ShapesView: View {
    var body: some View {
        Triangle()
            .fill(.yellow)
            .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 300, height: 300)
        
        Arc(
            startAngle: .degrees(0),
            endAngle: .degrees(200),
            clockwise: true
        )
        .stroke(.blue, lineWidth: 10)
        .strokeBorder(.yellow, lineWidth: 40)
        .frame(width: 300, height: 300)
    }
}

#Preview {
    ShapesView()
}
