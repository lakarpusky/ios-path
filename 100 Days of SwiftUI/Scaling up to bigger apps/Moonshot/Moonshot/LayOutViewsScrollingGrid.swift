//
//  LayOutViewsScrollingGrid.swift
//  Moonshot
//
//  Created by ☕️ Gabo.montero on 3/9/24.
//

import SwiftUI

struct LayOutViewsScrollingGrid: View {
    let layout = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80))
    ]
    
    // .. to fit as many columns as possible, as long
    // .. as they are at least 80 points in width
    let layoutAdaptive = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layoutAdaptive) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    LayOutViewsScrollingGrid()
}
