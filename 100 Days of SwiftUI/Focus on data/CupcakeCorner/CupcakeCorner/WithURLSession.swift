//
//  WithURLSession.swift
//  CupcakeCorner
//
//  Created by ☕️ Gabo.montero on 3/15/24.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct WithURLSession: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        // .. creating the URL we want to read
        guard let url = URL(string: "https://itunes.apple.com/search?term=marilyn+manson&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            // .. fetching the data for that URL
            let (data, _) = try await URLSession.shared.data(from: url) // .. return its a tuple
            
            // .. decoding the result into a "Response" struct
            if let decodedReponse = try? JSONDecoder().decode(Response.self, from: data) {
                results =  decodedReponse.results
            }
        } catch {
            print("Invalid data \(error)")
        }
    }
}

#Preview {
    WithURLSession()
}
