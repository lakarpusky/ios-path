//
//  Activity.swift
//  HabitTracking
//
//  Created by ☕️ Gabo.montero on 3/15/24.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    let title: String
    let description: String
    var completionCount = 0
}

@Observable
class Activities {
    var items = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                // .. store current data to user local store
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        // .. reading from user local store for saved "Activities"
        if let data = UserDefaults.standard.data(forKey: "Activities") {
            // .. parsing the values if any available
            if let decodedData = try? JSONDecoder().decode([Activity].self, from: data) {
                items = decodedData
                return
            }
        }
        
        items = []
    }
}
