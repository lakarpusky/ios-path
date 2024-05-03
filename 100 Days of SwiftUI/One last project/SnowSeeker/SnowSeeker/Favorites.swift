//
//  Favorites.swift
//  SnowSeeker
//
//  Created by ☕️ Gabo.montero on 5/3/24.
//

import Foundation

@Observable
class Favorites {
    private var resorts: Set<String>
    private let key = "Favorites" // to read/write in (UserDefaults)
    
    init() {
        // load our saved data
        
        resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        // write out our data
    }
}
