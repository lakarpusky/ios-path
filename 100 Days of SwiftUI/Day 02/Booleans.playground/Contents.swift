import UIKit

// === How to store truth with booleans === //

// .. making a boolean is just like:

let goodDogs = true
let gameOver = false

// .. you can also assign a boolean's initial value from some other code
// .. as long its either "true" or "false":

let isMultiple = 120.isMultiple(of: 3)

// .. ulike the other types of data, booleans don't have arithmetic operators
// .. however, booleans do have one special operator "!" which means "not"
// .. this flips a boolean's value from:
// .. "true" to "false", or "false" to "true"

var isAuthenticated = false

isAuthenticated = !isAuthenticated
print(isAuthenticated)

isAuthenticated = !isAuthenticated
print(isAuthenticated)

// .. booleans do have a little extra functionality that can be useful,
// .. if you call "toggle()" on a boolean:
// .. it will flip a "true" value to "false", and a "false" value to "true"

var gameOver2 = false
print(gameOver2)

gameOver2.toggle()
print(gameOver2)
