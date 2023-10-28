//
//  AnimatabledataView.swift
//  Drawing
//
//  Created by ☕️ Gabo.montero on 10/28/23.
//

import SwiftUI

struct Trapezoid: Shape {
    
    var insetAmount: Double
    
    // 1. animating simple shapes
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct Checkerboard: Shape {
    
    var rows: Int
    var columns: Int
    
    // 2. animating complex shapes
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }
        
        set {
            rows = Int(newValue.first)
            columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        //.. figure out how each row/column needs to be
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)
        
        //.. loop over all rows and columns, making alternating squares colored
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    //.. this square should be colored; add a rectangle here
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        
        return path
    }
}

struct AnimatabledataView: View {
    
    @State private var insetAmount = 50.0
    
    @State private var rows = 4
    @State private var columns = 4
    
    var body: some View {
        // 1. animating simple shapes
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation {
                    insetAmount = Double.random(in: 10...90)
                }
            }
        
        Spacer()
        
        // 2. animating complex shapes
        Checkerboard(rows: rows, columns: columns)
            .frame(width: 500, height: 500)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    rows = Int.random(in: 4...8)
                    columns = Int.random(in: 4...16)
                }
            }
    }
}

#Preview {
    AnimatabledataView()
}
