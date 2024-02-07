import Cocoa

// TOPIC: How to create constants and variables

var greeting = "Hello, playground"

// .. variable
var name = "Ted"
name = "Rebecca"
name = "Keeley"

// .. constant
let character = "Daphne"

var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

// .. constants
let managerName = "Michel Scott"
let dogBread = "Samoyed"
let meaningOfLife = "How many roads must a man walk down?"

// .. try to prefer constants over vairables as much as you can
// .. gives swift the chance to optimize your code better
// .. stop you from changing values by accident
