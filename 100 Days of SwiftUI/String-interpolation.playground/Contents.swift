import Cocoa

// TOPIC: How to join strings together

var greeting = "Hello, playground"

let firstPart = "Hello, "
let seconPart = "world!"
let greeting2 = firstPart + seconPart

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

let luggageCode = "1" + "2" + "3" + "4" + "5"

let quote = "Then he tapped a sign saying \"Belavieve\" and walked away."

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

let number = 11
let missionMessage = "Apollo \(number) landed on the moon."
print(missionMessage)

// .. can include calculations inside
print("5 x 5 is \(5 * 5)")
