import Cocoa

// TOPIC: How to store truth with Booleans

var greeting = "Hello, playground"

let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

let goodDos = true

var gameOver = false
print(gameOver)
gameOver.toggle()
print(gameOver)

let isMultiple = 120.isMultiple(of: 3)

// .. flips booleans value
var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
