import UIKit


// === How to create your own classes === //


// .. classes differ from structs:

// .. 1. inheritance
// .. 2. you either need to write your own initalizer, or assign default values
// .. 3. when copy an instance of a class, both copies share the same data
// .. 4. when the final copy of a class instance is destroyed, swift can optionally run a special func "deinitializer"
// .. 5. even if you make a class constant, you can stil change its properties as long as they are variables

class Game {
    var score = 0 {
        didSet {
            print("score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10
