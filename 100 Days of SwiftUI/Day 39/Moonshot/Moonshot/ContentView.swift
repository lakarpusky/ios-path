//
//  ContentView.swift
//  Moonshot
//
//  Created by ☕️ Gabo.montero on 10/21/23.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader{ geo in
                Image(uiImage: #imageLiteral(resourceName: "example.jpg"))
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width * 0.8)
                // .. center the view
                    .frame(width: geo.size.width, height: geo.size.height)
            }
            
            Button("Decode JSON") {
                let input = """
                {
                    "name": "Taylor Swift",
                    "address": {
                        "street": "555, Taylor Swift Avenue",
                        "city": "Nashville"
                    }
                }
                """

                // more code to come
                let data = Data(input.utf8)
                let decoder = JSONDecoder()
                
                if let user = try? decoder.decode(User.self, from: data) {
                    print(user.address.street)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
