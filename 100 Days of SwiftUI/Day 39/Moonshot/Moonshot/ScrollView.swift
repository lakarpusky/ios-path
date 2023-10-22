//
//  ScrollView.swift
//  Moonshot
//
//  Created by ☕️ Gabo.montero on 10/21/23.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText \(text)")
        self.text = text
    }
}

struct ScrollViewExample: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    ScrollViewExample()
}
