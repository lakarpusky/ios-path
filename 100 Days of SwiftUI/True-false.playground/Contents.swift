import Cocoa

// TOPIC: How to check a condition is true or false

let score = 85

if score > 80 {
    print("Great job!")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("where we're going, we don't need roads.")
}

if percentage < 85 {
    print("sorry, you failed the test.")
}

if age >= 18 {
    print("you're elegible to vote.")
}

let ourName = "dave lister"
let friendName = "arnold rimmer"

if ourName < friendName {
    print("it's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("it's \(friendName) vs \(ourName)")
}

var numbers = [1, 2, 3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}

print(numbers)

let country = "canada"

if country == "australia" {
    print("G'day!")
}

let name = "taylor swift"

if name != "anonymous" {
    print("welcome, \(name)")
}

var username = "taylor123"

if username == "" || username.isEmpty || username.count == 0 {
    username = "anonymous"
}

print("welciome, \(username)")
