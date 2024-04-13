//
//  ImageItem.swift
//  ConsolidationVI
//
//  Created by ☕️ Gabo.montero on 4/13/24.
//

import Foundation
import SwiftUI

struct ImageItem: Identifiable, Hashable, Comparable {
    var id = UUID()
    var name: String
    var image: Image?
    var date = Date.now
    
    var longDate: String {
        date.formatted(date: .complete, time: .shortened)
    }
    
    var shortDate: String {
        date.formatted(date: .abbreviated, time: .omitted)
    }
    
    static func == (lhs: ImageItem, rhs: ImageItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // to add custom conformanace to (Comparable) to get array sorting to work
    static func < (lhs: ImageItem, rhs: ImageItem) -> Bool {
        lhs.name < rhs.name
    }
}
