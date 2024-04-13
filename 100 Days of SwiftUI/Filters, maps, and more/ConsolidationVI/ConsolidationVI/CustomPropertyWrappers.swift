//
//  CustomPropertyWrappers.swift
//  ConsolidationVI
//
//  Created by ☕️ Gabo.montero on 4/12/24.
//

import Foundation

// what property wrappers let us do is use that for any kind of property in a struct or class
// a simple struct that wraps some kind of (BinaryInteger) value
@propertyWrapper // that's it -we now have our own property wrapper
struct NonNegative<Value: BinaryInteger> {
    var value: Value
    
    init(wrappedValue: Value) {
        if wrappedValue < 0 {
            value = 0
        } else {
            value = wrappedValue
        }
    }
    
    var wrappedValue: Value {
        get { value }
        set {
            if newValue < 0 {
                // if the new value is below (0) we instead make it exactly (0),
                // so that this struct can never be negative.
                value = 0
            } else {
                value = newValue
            }
        }
    }
}

// property wrappers can only be used on properties rather than plain variables or constants
struct User {
    @NonNegative var score = 0
}

// now we can create a user and add/remove points freely,
// knowing for sure the score will never go below (0).

var user = User()
//user.score += 10
//print(user.score)
//
//user.score -= 10
//print(user.score)
