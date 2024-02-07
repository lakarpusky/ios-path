import Cocoa

// TOPIC: How to store whole/integer numbers

var greeting = "Hello, playground"

let score = 10
let reallyBig = 100_000_000 // .. ignore the underscore

let lowerScore = score - 2
let higherScore = score + 10
let squareSocore = score * score
let halvedScore = score / 2

// .. avoiding creating a new variable each time
var counter = 10
counter += 5 // .. shorthand operator
print(counter)

// .. compaund assignment operators
counter *= 2
counter -= 10
counter /= 2

// .. usefull functionalities
let number = 120
print(number.isMultiple(of: 3))
