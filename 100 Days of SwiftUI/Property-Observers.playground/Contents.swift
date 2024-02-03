import UIKit


// === How to take action when a property changes === //


// .. Property observers:
// .. special pieces of code that run when properties change
// .. you cannot assign a property oberser to a constant

// .. These take two forms:
// .. 1. "didSet": run when the property just changed
// .. 2. "willSet": run before the property changed

// .. example:
struct Game {
    var score = 0 {
        didSet {
            print("score is now \(score)")
        }
    }
}

var game = Game()

game.score += 10
game.score -= 3
game.score += 1


// .. swift automatically provides the constant "oldValue" inside "didSet"
// .. there's also a "willSet" variant that runs some code before the property changes
// .. which in turn provides the "newValue" that will be assigned

struct App {
    var contacts = [String]() {
        willSet {
            print("current value is \(contacts)")
            print("new value will be: \(newValue)")
        }
        
        didSet {
            print("there are now \(contacts.count) contacts.")
            print("old values was \(oldValue)")
        }
    }
}

var app =  App()

app.contacts.append("adrianf")
app.contacts.append("allenw")
app.contacts.append("ishs")

// .. appending to an array will trigger both "willSet" and "didSet"
