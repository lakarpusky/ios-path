//
//  ModifierOrder.swift
//  ViewsAndModifiers
//
//  Created by ☕️ Gabo.montero on 2/25/24.
//

import SwiftUI

struct ModifierOrder: View {
    var body: some View {
        Button("Hello, world!") {
            print(type(of: self.body))
        }
        .padding()
        .background(.yellow)
        .padding()
        .background(.orange)
        .padding()
        .background(.green)
        .padding()
        .frame(width: 200, height: 200)
        .background(.yellow)
    }
}

#Preview {
    ModifierOrder()
}
