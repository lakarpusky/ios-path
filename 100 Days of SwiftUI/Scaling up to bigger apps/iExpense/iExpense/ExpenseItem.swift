//
//  ExpenseItem.swift
//  iExpense
//
//  Created by ☕️ Gabo.montero on 3/7/24.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            // .. converting our data to JSON
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        // .. read whatever is in "items" as a "Data" object
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            // .. unarchiving the "Data" object into an array of "ExpenseItem"
            // .. ".self" - we're referring to the type itself, known as the `type object` -
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
