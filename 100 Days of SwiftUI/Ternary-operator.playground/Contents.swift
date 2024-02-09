import Cocoa

// TOPIC: How to use the ternary conditional operator for quick tests

let age = 18
let canVote = age >= 18 ? "yes" : "no"
print(canVote)

let hour = 23
print(hour < 12 ? "it's before noon" : "it's after noon")

let names = ["jayne", "kaylee", "mal"]
let crewCount = names.isEmpty ? "no one" : "\(names.count) people"
print(crewCount)

enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)
