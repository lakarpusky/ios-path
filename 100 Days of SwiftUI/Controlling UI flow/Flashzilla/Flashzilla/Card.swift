//
//  Card.swift
//  Flashzilla
//
//  Created by ☕️ Gabo.montero on 4/24/24.
//

import Foundation

struct Card {
    var prompt: String
    var answer: String
    
    static let example = Card(
        prompt: "Who played the 13th Doctor in Doctor Who?",
        answer: "Jodie Whittaker"
    )
}
