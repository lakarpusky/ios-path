import UIKit

// === How to check a condition is true or false === //

// .. example 01:
let score = 85

if score > 80 {
    print("great job")
}

// .. example 02:
let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("we don't need roads")
}

if percentage < 85 {
    print("sorry, failed")
}

if age >= 18 {
    print("to vote")
}

// .. example 03:
let ourName = "lister"
let friendName = "rimmer"

if ourName < friendName {
    print("it's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("it's \(friendName) vs \(ourName)")
}

// .. example 04:
var numbers = [1, 2, 3]

numbers.append(4) // .. add a 4th

if numbers.count > 3 { // .. if we have over 3 items
    numbers.remove(at: 0) // .. remove the oldest number
}

print(numbers) // .. disply the resilt

// .. example 05:
let country = "canada"

if country == "australia" {
    print("g'day")
}

// .. example 06:
let name = "swift"

if name != "anonymous" {
    print("welcome, \(name)")
}

// .. example 07:
var username = "taylor013"

if username == "" { // .. if username contains an empty string
    username = "anonymous" // .. make it equal to anonymous
}

print("welcome, \(username)") // .. now print a welcome message

if username.count == 0 { // .. 👎
    username = "anonymous"
}

if username.isEmpty { // .. 👍
    username = "anonymous"
}


// === How does swift let us compare many types of data === //

let firstName = "paul"
let secondName = "sophie"
let firstAge = 40
let secondAge = 10

// .. then we can compare:
print(firstName == secondName)
print(firstName != secondName)
print(firstName < secondName)
print(firstName >= secondName)

print(firstAge == secondAge)
print(firstAge != secondAge)
print(firstAge < secondAge)
print(firstAge >= secondAge)

// .. we can even ask to make our enums comparable
enum Sizes: Comparable {
    case small, medium, large
}

let first = Sizes.small
let second = Sizes.large

print(first < second)


// === How to check multiple conditions === //

let userAge = 16

if userAge >= 16 {
    print("you can vote")
} else {
    print("sorry, to young to vote")
}

// .. there's an even more advanced condition called "else if"
let a = false
let b = false

if a {
    print("a is true")
} else if b {
    print("b is true")
} else {
    print("b are false")
}

// .. you can also check more than one thing
let temp = 25

if temp > 20 {
    if temp < 30 {
        print("it's a nice day")
    }
}

// .. a shorter alternative: we can use && to combine conditions together
if temp > 20 && temp < 30 {
    print("it's a nice day")
}

// .. example:
let guyAge = 14
let hasParentalConsent = true

if guyAge >= 18 || hasParentalConsent {
    print("can buy the game")
}

// .. let's try a more complex example:
enum TransportOrigin {
    case airplane, helicopter, bicycle, car, scooter
}

let transort = TransportOrigin.airplane

if transort == .airplane || transort == .helicopter {
    print("let's fly")
} else if transort == .bicycle {
    print("bike path...")
} else if transort == .car {
    print("stuck in traffic")
} else {
    print("hire a scooter now")
}

