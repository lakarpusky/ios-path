//
//  ExpenseItem.swift
//  iExpense
//
//  Created by ☕️ Gabo.montero on 10/18/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
