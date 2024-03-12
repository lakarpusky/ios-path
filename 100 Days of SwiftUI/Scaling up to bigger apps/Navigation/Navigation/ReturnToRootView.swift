//
//  ReturnToRootView.swift
//  Navigation
//
//  Created by ☕️ Gabo.montero on 3/12/24.
//

import SwiftUI

struct DetailView2: View {
    var number: Int
    @Binding var path: [Int]
    
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path.removeAll() // .. or path = NavigationPath()
                }
            }
    }
}

struct ReturnToRootView: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            DetailView2(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView2(number: i, path: $path)
                }
        }
    }
}

#Preview {
    ReturnToRootView()
}
