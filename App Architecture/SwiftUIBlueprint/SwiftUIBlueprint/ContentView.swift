//
//  ContentView.swift
//  SwiftUIBlueprint
//
//  Created by ☕️ Gabo.montero on 5/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("ContentView.WelcomeMessage".localized(arguments: "Gabo"))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
