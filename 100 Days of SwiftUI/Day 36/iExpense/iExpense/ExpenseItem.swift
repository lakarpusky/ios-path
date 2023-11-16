//
//  ExpenseItem.swift
//  iExpense
//
//  Created by ☕️ Gabo.montero on 10/18/23.
//

import Foundation
import Observation

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
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decoedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decoedItems
                return
            }
        }
        
        items = []
    }
}
