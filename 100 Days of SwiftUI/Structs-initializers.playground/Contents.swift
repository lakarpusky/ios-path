import Cocoa

// TOPIC: How to create custom initializers

// .. 1 rule only:
// .. we must ensure every property inside the struct
// .. has an initial value, by the time the initializer finishes

struct Player {
    let name: String
    let number: Int
    
    // .. custom initializer
    // .. we lose access to swift auto member-wise initializer
    // .. 1. there is no func keyword
    // .. 2. no explicit return type
    // .. 3. we use "self" to assign values
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
        // .. we can call functions only after all parameters has inital values
        // ..
    }
}

// .. member-wise initializer:
// .. initializer defined automatically by swift
// .. it accepts each property in the order it was defined in the struct
let player = Player(name: "megan")
print(player.number)
