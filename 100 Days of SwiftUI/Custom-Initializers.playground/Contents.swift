import UIKit


// === How to create custom initializers === //


// .. specialized methods designed to prepare a new struct isntance to be used
// .. can also create your own as long as you follow one golden rule:

// .. 1. all properties must have a value by the time the initializer ends

// .. example:
struct Player {
    let name: String
    let number: Int
    
    // .. write our own to do the same thing:
    // .. ** never explicitly have a retun type
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
    
    // .. we could say that you must provide a name,
    // .. but the shirt number is randomized
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

// .. memberwise initializer:
// .. an initializer that accepts each property in the order it was defined
let player = Player(name: "meganr", number: 15)
let player2 = Player(name: "airj")

print(player.number)
print(player2.number)

// .. as soon as you add a custom initializer, default "memberwise initializer" goes away
// .. if you want it to stay, move your initializer to an "extension"
