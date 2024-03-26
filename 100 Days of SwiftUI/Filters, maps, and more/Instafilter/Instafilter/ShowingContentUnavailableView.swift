//
//  ShowingContentUnavailableView.swift
//  Instafilter
//
//  Created by ☕️ Gabo.montero on 3/26/24.
//

import SwiftUI

struct ShowingContentUnavailableView: View {
    var body: some View {
        // .. shows a standard user interface for when your app has nothing to display
        ContentUnavailableView(
            "No snippets",
            systemImage: "swift",
            description: Text("Your don't have any saved snippets yet.")
        )
        
        // .. if you want full control,
        // .. you can provide individual views for both title and description
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create Snippet") {
                //
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ShowingContentUnavailableView()
}
