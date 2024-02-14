import Cocoa

// TOPIC: How to create your own classes

// .. similar to structs:
// .. - you get to create and name them
// .. - add properties, methods, proerty observers, and access control
// .. - create custom initializers to configure nuew instances

// .. key differences from structs:
// .. - inheritance: you can make one ckass build upoen functionality in another class
// .. - swift won't generate a memberwise initializer for classes
// .. - if you copy an instance of a class, both copies share the same data
// .. - we can add an deinitializer to run then the final copy is destroyed
// .. - constant class instances can have their variable properties changed

class Game {
    var score = 0 {
        didSet {
            print("score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10
