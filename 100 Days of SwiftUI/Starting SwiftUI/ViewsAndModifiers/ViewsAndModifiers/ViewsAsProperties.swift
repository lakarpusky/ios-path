//
//  ViewsAsProperties.swift
//  ViewsAndModifiers
//
//  Created by ☕️ Gabo.montero on 2/25/24.
//

import SwiftUI

struct ViewsAsProperties: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    var motto3: some View {
        Text("Draco dormiens")
    }
    
    // .. 1. send multiple views back
    var vstack: some View {
        VStack {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    // .. 2. send multiple views back
    var group: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    // .. 3. send multiple views back
    // .. - final SEUGGESTION - 
    @ViewBuilder var builder: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            motto1
                .foregroundStyle(.red)
            motto2
                .foregroundStyle(.blue)
            motto3
        }
    }
}

#Preview {
    ViewsAsProperties()
}
