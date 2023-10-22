//
//  ScrollingGrid.swift
//  Moonshot
//
//  Created by ☕️ Gabo.montero on 10/21/23.
//

import SwiftUI

struct ScrollingGrid: View {
    
    let layout = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80))
    ]
    
    // .. to fit as many columns as possible
    let layoutAdaptiveSize = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: layoutAdaptiveSize) {
                    ForEach(0..<1000) {
                        Text("Item \($0)")
                    }
                }
            }
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: layoutAdaptiveSize) {
                    ForEach(0..<1000) {
                        Text("Item \($0)")
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollingGrid()
}
