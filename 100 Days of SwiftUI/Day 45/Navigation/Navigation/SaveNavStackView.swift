//
//  SaveNavStackView.swift
//  Navigation
//
//  Created by ☕️ Gabo.montero on 11/12/23.
//

import SwiftUI

@Observable
class PathStore {
    // .. using "NavigationPath": `path: NavigationPath`
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            // .. using "NavigationPath": `NavigationPath.CodeableRepresentation.self`
            if let decoded = try? JSONDecoder().decode(
                NavigationPath.CodableRepresentation.self,
                from: data
            ) {
                // .. using "NavigationPath": `path = NavigationPath(decoded)`
                path = NavigationPath(decoded)
                return
            }
        }
        
        // .. using "NavigationPath": `path = NavigationPath()`
        path = NavigationPath()
    }
    
    func save() {
        // .. using "NavigationPath"
        // ===
        // .. the method needs to write the "Codeable" representation of our navigation path
        // .. "NavigationPath" doesn't require its data types conforms to "Codeable" ("Hashable" only)
        // .. Swift can't verify at compile time that there is a valid "Codable" representation of the navigation path
        
        // 1. we need to request it and check what comes back
        guard let representation = path.codable else { return }
        
        do {
            // 2. `let data = try JSONEncoder().encode(representation)`
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

struct Detail3View: View {
    var number: Int
    
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}

struct SaveNavStackView: View {
    @State private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            Detail3View(number: 0)
                .navigationDestination(for: Int.self) { i in
                    Detail3View(number: i)
                }
        }
    }
}

#Preview {
    SaveNavStackView()
}
