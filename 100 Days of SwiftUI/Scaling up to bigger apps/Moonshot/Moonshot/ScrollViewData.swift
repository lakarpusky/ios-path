//
//  ScrollViewData.swift
//  Moonshot
//
//  Created by ☕️ Gabo.montero on 3/8/24.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct ScrollViewData: View {
    var body: some View {
        // .. for times when we want to scroll arbitrary data
        ScrollView {
            // .. won't create views until they are actually shown
            LazyVStack(spacing: 10) { // .. will load their content on-demand
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            } // ..lazy stacks always take up as much as room as is available in our layouts
            //.frame(maxWidth: .infinity) // .. to have the whole are scrollable
        }
    }
}

#Preview {
    ScrollViewData()
}
