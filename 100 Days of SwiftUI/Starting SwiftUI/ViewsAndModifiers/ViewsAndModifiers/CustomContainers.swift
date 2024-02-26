//
//  CustomContainers.swift
//  ViewsAndModifiers
//
//  Created by ☕️ Gabo.montero on 2/25/24.
//

import SwiftUI

// .. a new type of stack called a "GridStack"
// .. let us create any number of views inside a fixed grid

// .. you can provide any kind of content, but must conform to the "View" protocol
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

// .. having a custom container, we can write a view
struct SomeView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            HStack {
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
    }
}

struct CustomContainers: View {
    var body: some View {
        SomeView()
    }
}

#Preview {
    CustomContainers()
}
