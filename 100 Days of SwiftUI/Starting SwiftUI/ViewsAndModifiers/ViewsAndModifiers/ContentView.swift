//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by ☕️ Gabo.montero on 2/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        // .. take up more space, to allow it to fill the screen
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.orange)
    }
}

#Preview {
    ContentView()
}
