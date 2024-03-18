//
//  Student.swift
//  Bookworm
//
//  Created by ☕️ Gabo.montero on 3/17/24.
//

import Foundation
import SwiftData

// .. How to set up SwiftData by hand
// step 1. Defining the data we want to use in our app

// .. this class is called a SwiftData Model
@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
