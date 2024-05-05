//
//  Cart.swift
//  FoodOrdering
//
//  Created by ☕️ Gabo.montero on 5/5/24.
//

import SwiftUI

struct Cart: Identifiable {
    var id = UUID().uuidString
    var item: Item
    var quantity: Int
}
