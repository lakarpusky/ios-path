import UIKit

// === How to use a while loop to repeat work === //

var countdown = 10

while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}

print("blast off!")

// .. new inteher between 1 and 1000
let id = Int.random(in: 1...1000)
print("integer is \(id)")

// .. random decimal between 0 and 1
let amount = Double.random(in: 0...1)
print("decimal is \(amount)")


// .. roll some virtual 20-sided dice again and again,
// .. ending the loop only when a 20 is rolled:
var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

print("critical hit!")


// .. "for" loops are more common when you have a finite amount of data to go through
// .. "while" loops are really helpful when you need a custom condition
