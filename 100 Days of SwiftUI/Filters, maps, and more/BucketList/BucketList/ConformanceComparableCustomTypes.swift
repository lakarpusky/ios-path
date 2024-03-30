//
//  ConformanceComparableCustomTypes.swift
//  BucketList
//
//  Created by ☕️ Gabo.montero on 3/30/24.
//

import SwiftUI

// .1. step: add the (Comparable) conformance
struct User: Identifiable, Comparable {
    let id = UUID()
    var firstName: String
    var lastName: String
    
    // .2. step: add a method called "<" that takes two users and returns true
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName // .. if the first should be sorted before the second
    }
}

struct ConformanceComparableCustomTypes: View {
    let values = [1, 5, 3, 6, 2, 9].sorted()
    
    let users = [
        User(firstName: "arnold", lastName: "rimmer"),
        User(firstName: "kristine", lastName: "kochanski"),
        User(firstName: "david", lastName: "lister")
    ].sorted()
    
    var body: some View {
        List(values, id: \.self) {
            Text(String($0))
        }
        
        List(users) { user in
            Text("\(user.lastName), \(user.firstName)")
        }
    }
}

#Preview {
    ConformanceComparableCustomTypes()
}
