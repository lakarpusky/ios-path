//
//  BackHomeVIew.swift
//  Navigation
//
//  Created by ☕️ Gabo.montero on 11/12/23.
//

import SwiftUI

struct Datail2View: View {
    var number: Int
    @Binding var path: [Int]
    
    var body: some View {
        // .. pushes to a new random number whenever it's presed
        NavigationLink(
            "Go to Random Number",
            value: Int.random(in: 1...1000)
        )
        .navigationTitle("Number: \(number)")
        .toolbar {
            Button("Home") {
                path.removeAll()
            }
        }
    }
}

// .. Return Home:
// ===
// 1. Simple array: call `path.removeAll()` to remove everything
// 2. `NavigationPath`: set it to a new empty instance `path = NavigationPath()`

// .. How can you do that from a SubView, when you don't have access to the original "path" property
// ===
// 1. store your path in a external class that uses `@Observable`
// 2. `@Binding`: let us pass an `@State` property into another view and modify it from there

struct BackHomeView: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            Datail2View(number: 0, path: $path) // .. initial value
                .navigationDestination(for: Int.self) { i in
                    // .. but navigating to a new view every time a new int is shown
                    Datail2View(number: i, path: $path)
                }
        }
    }
}

#Preview {
    BackHomeView()
}
