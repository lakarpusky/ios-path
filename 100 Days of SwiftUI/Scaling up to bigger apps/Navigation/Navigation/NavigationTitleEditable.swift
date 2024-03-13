//
//  NavigationTitleEditable.swift
//  Navigation
//
//  Created by ☕️ Gabo.montero on 3/12/24.
//

import SwiftUI

struct NavigationTitleEditable: View {
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationTitleEditable()
}
