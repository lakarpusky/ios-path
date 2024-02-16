import Cocoa

// TOPIC: How to use opaque return types

// .. lets us hide information in our code,
// .. but not from the swift compiler

func getRandomNumber() -> some Equatable { // .. hidding the return type "flexibility"
    Double.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())

let num = getRandomNumber()
print(type(of: num)) // .. but swift knows always know
