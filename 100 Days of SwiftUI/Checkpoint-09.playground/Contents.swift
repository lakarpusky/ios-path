import Cocoa

// TOPIC: Checkpoint 09

// .. wtire a function that accepts an optional array of integers, and returns one o those integers randomly
// .. if the array is missing or empty, return a new random number in the range 1 throgh 100
// .. write your function in a single line of code

func getRandomNumber(in array: [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 1...10)
}

let number = getRandomNumber(in: [])
print(number)
