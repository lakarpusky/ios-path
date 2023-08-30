import UIKit

// .. a func that accepts an optional array of integers, and returns one randomly
// .. array missing/empty return a random number in the range 1-100

func randomNumber(numbers: [Int]?) -> Int {
    numbers?.randomElement() ?? Int.random(in: 1...100)
}
