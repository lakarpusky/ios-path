import Cocoa

// TOPIC: How to store decimal "floating point" numbers

var greeting = "Hello, playground"

let number = 0.1 + 0.2
print(number)

let a = 1
let b = 2.0
let c = Double(a) + b

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

// .. once swift has decided what data type a constant or variable holds
// ...they must allways hold that same type of data

var name = "Nicaolas"

var rating = 5.0
rating *= 2

// .. CGFloat: old APIs "yust give it a Double"
