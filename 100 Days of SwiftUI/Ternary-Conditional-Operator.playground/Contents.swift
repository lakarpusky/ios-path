import UIKit

// === How to use the ternary conditional operator for quick tests === //

// .. you'll often hear it called just "the ternary operator"
let age = 18
let canVote = age >= 18 ? "yes" : "no"
print(canVote)

// .. example:
let hour = 23
print(hour < 12 ? "it's before noon" : "it's after noon")

// .. example:
let names = ["jayne", "kaylee", "mal"]
let crewCount = names.isEmpty ? "no one" : "\(names.count) people"
print(crewCount)

// .. it gets a little hard to read when your
// .. condition use "==" to check for equality

enum Theme {
    case light, dark
}

let theme = Theme.dark
let background = theme == .dark ? "black" : "white"
print(background)
