//
//  Appetizer.swift
//  Appetizers
//
//  Created by ☕️ Gabo.montero on 5/12/24.
//

import Foundation

struct Appetizer: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

// .. mirroring the structure of the server response
struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(
        id: 0001,
        name: "Asian Flank Steak",
        description: "This is a description for my appetizer. It's a summy.",
        price: 9.99,
        imageURL: "asian-flank-steak",
        calories: 99,
        protein: 99,
        carbs: 99
    )
    
    static let appetizers: [Appetizer] = Array(repeating: sampleAppetizer, count: 4)
}
