//
//  Item.swift
//  FoodOrdering
//
//  Created by ☕️ Gabo.montero on 5/5/24.
//

import SwiftUI

struct Item: Identifiable {
    var id: String
    var item_name: String
    var item_cost: NSNumber
    var item_details: String
    var item_image: String
    var item_ratings: String
    // .. to identify whether it is added to cart
    var isAdded: Bool = false
}
