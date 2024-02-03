import UIKit


// === How to use opaque return types === //


// .. 1. let's implement two simple funcs
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())
