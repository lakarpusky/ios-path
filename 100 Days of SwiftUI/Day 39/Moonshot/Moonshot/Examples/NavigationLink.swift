//
//  NavigationLinkExample.swift
//  Moonshot
//
//  Created by ☕️ Gabo.montero on 10/21/23.
//

import SwiftUI

struct NavigationLinkExample: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail View!")
                } label: {
                    Text("Row \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    NavigationLinkExample()
}
