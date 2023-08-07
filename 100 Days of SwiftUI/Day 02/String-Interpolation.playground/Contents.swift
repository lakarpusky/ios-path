import UIKit

// === How to join string together === //

// .. swift gives two ways to combine strings:
// .. 1. using "+"
// .. 2. and a special technique called "string interpolation" that can place varaibles inside strings

// ... using "+"
let firstPerson = "hello"
let secondPart = "world!"
let greeting = firstPerson + secondPart
// .. you can do this many times if you need to:
let people = "haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

// .. string interpolation
let name = "lakar"
let age = 33
let message = "hello, my name is \(name) and I'm \(age) years old"
print(message)

// .. TIP: you can put calculations inside string interpolation
print("5x5 is \(5 * 5)")

// .. swift gives us "string interpolation" as a way to injecting
// .. custom data into strings at runtime
var city = "cardiff"
var welcome = "wlcome to \(city)"
print(welcome)
