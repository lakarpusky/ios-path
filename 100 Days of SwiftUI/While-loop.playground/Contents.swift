import Cocoa

// TOPIC: How to use a while loop to repeat work

var countdown = 10

// .. run until condition is false
while countdown > 0 {
    print("\(countdown)..")
    countdown -= 1
}

print("blast off!")

let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

var roll = 0

// .. run until condition is false
while roll != 20 {
    roll = Int.random(in: 1...20)
    print("i rolled a \(roll)")
}

print("critical hit!")
