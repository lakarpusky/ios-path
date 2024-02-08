import Cocoa

// TOPIC: How to use sets for fast data lookup

// .. don't remember the order
// .. don't allow duplicates

var actors = Set([
    "Denzel",
    "Tom",
    "Nicolas",
    "Samuel",
])
print(actors)

// .. insert instead of append
actors.insert("Liam")
print(actors)
