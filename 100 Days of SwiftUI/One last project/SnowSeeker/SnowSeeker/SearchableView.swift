//
//  SearchableView.swift
//  SnowSeeker
//
//  Created by ☕️ Gabo.montero on 5/2/24.
//

import SwiftUI

struct SearchableView: View {
    @State private var searchText = ""
    let names = ["Subh", "Vina", "Melvin", "Stefanie"]
    
    // .. could use a computed property to handle the actual filtering
    var filteredNames: [String] {
        if searchText.isEmpty {
            names
        } else {
            names.filter {
                // .. best way to search for things based on user input,
                // .. it automatically ignores case and accents
                $0.localizedStandardContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
            // .. best used with some kind of data filtering
            .searchable(text: $searchText, prompt: "Look for something")
            .navigationTitle("Searching")
        }
    }
}

#Preview {
    SearchableView()
}
