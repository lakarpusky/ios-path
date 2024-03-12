//
//  SavePathsUsingCodable.swift
//  Navigation
//
//  Created by ☕️ Gabo.montero on 3/12/24.
//

import SwiftUI

@Observable
class PathStore {
    var path: [Int] { // .. or :NavogationPath
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            // .. .decode(NavigationPath.CodableRepresentation.self, from: data)
            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
                path = decoded // .. or = NavigationPath(decoded)
                return
            }
        }
        
        path = [] // .. or = NavigationPath()
    }
    
    func save() {
        do {
            // .. or guard let representation = path.codable else { return }
            let data = try JSONEncoder().encode(path) // .. or .encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data.")
        }
    }
}

struct DetailView3: View {
    var number: Int
    
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}

struct SavePathsUsingCodable: View {
    @State private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView3(number: 0)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i)
                }
        }
    }
}

#Preview {
    SavePathsUsingCodable()
}
