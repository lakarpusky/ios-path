//
//  HierarchicalCodableData.swift
//  Moonshot
//
//  Created by ☕️ Gabo.montero on 3/8/24.
//

import SwiftUI

// .. want to decode this kind of hierarchical data:
// .. - the key is to create separate types of each level you have -

// .. as long as the data matches the hierarchy you've asked for, "Codable" is capable of deconig everyhing

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct HierarchicalCodableData: View {
    var body: some View {
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
            
            let data = Data(input.utf8) // .. converto JSON to the "Data" type
            let decoder = JSONDecoder()
            // .. decode that into a "User" instance
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

#Preview {
    HierarchicalCodableData()
}
