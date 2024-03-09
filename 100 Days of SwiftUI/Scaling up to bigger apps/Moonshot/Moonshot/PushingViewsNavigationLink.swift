//
//  PushingViewsNavigationLink.swift
//  Moonshot
//
//  Created by ☕️ Gabo.montero on 3/8/24.
//

import SwiftUI

struct PushingViewsNavigationLink: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { row in
                NavigationLink("Row \(row)") { // .. for showing details about the user's selection
                    Text("Detail \(row)")
                }
            }
            .navigationTitle("SwfitUI")
        }
    }
}

#Preview {
    PushingViewsNavigationLink()
}
