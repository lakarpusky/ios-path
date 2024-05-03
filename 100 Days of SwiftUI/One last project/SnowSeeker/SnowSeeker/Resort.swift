//
//  Resort.swift
//  SnowSeeker
//
//  Created by ☕️ Gabo.montero on 5/2/24.
//

import Foundation

struct Resort: Codable, Hashable, Identifiable {
    var id: String
    var name: String
    var country: String
    var description: String
    var imageCredit: String
    var price: Int
    var size: Int
    var snowDepth: Int
    var elevation: Int
    var runs: Int
    var facilities: [String]
    
    // "static let": automatically makes them lazy - they don't get created until they are used.
    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
    static let example = allResorts[0]
}
