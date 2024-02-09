import Cocoa

// TOPIC: How to return values from functions

func rollDice() -> Int { // .. this will send back an integer
    Int.random(in: 1...6) // .. here is the integer I promized
}

let result = rollDice()
print(result)

// .. Do two strings contain the same letters, regardless of their order?
// .. This function should:
// ..   1. accept two string parameters
// ..   2. return true if their letters are the same

func containSameLetters(str1: String, str2: String) -> Bool {
    // .. when has one single line of code and returns a value
    // .. we can remove "return" word
    str1.sorted() == str2.sorted()
}

let result2 = containSameLetters(str1: "hello", str2: "llohe")
print("are letters identical? \(result2)")

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)

// .. if it doesn't return a value
func sayHello() {
    // .. you can still use "return" by itself to exit immediately
    return
}
