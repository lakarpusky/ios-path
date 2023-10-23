//
//  Astronaut.swift
//  Moonshot
//
//  Created by ☕️ Gabo.montero on 10/23/23.
//

import Foundation

// Codable: we can create instances from JSON
// Identifiable: we can use arrays of astronauts
struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}
