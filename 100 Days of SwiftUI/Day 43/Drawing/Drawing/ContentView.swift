//
//  ContentView.swift
//  Drawing
//
//  Created by ☕️ Gabo.montero on 10/26/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Circle()
            .stroke(.blue, lineWidth: 40)
            .strokeBorder(.orange, lineWidth: 40)
    }
}

#Preview {
    ContentView()
}
