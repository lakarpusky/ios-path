//
//  ConditionalModifiers.swift
//  ViewsAndModifiers
//
//  Created by ☕️ Gabo.montero on 2/25/24.
//

import SwiftUI

struct ConditionalModifiers: View {
    @State private var useRedText = false
    
    var body: some View {
        Button("Hello, world!") {
            useRedText.toggle()
        }
        .foregroundStyle(useRedText ? .red : .blue)
    }
}

#Preview {
    ConditionalModifiers()
}
