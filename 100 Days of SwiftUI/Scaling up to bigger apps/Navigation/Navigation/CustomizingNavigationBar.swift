//
//  CustomizingNavigationBar.swift
//  Navigation
//
//  Created by ☕️ Gabo.montero on 3/12/24.
//

import SwiftUI

struct CustomizingNavigationBar: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            //.toolbarBackground(.blue)
            .toolbarColorScheme(.dark, for: .navigationBar)
            //.toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    CustomizingNavigationBar()
}
