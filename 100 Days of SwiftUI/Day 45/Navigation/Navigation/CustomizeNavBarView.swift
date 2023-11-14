//
//  CustomizeNavBarView.swift
//  Navigation
//
//  Created by ☕️ Gabo.montero on 11/14/23.
//

import SwiftUI

struct CustomizeNavBarView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
            //.toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    CustomizeNavBarView()
}
