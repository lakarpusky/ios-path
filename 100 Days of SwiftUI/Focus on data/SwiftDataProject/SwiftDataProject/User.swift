//
//  User.swift
//  SwiftDataProject
//
//  Created by ☕️ Gabo.montero on 3/21/24.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String = "Anonymous"
    var city: String = "Unknown"
    var joinDate: Date = Date.now
    // .. deleting a "User" should automatically delete all their "Job" objects
    @Relationship(deleteRule: .cascade) var jobs: [Job]? = [Job]()
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}

@Model
class Job {
    var name: String = "None"
    var priority: Int = 1
    var owner: User? // .. the two models are linked together
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
