import Cocoa

// TOPIC: Checkpoint 03

// Your goal is to loop from 1 through 100, and for each number:
// 1. if it's a multiple of 3, print "Fizz"
// 2. if it's a multiple of 5, print "Buzz"
// 3. if it's a multiple of 3 and 5, print "FizzBuzz"
// 4. otherwise, just print the number

for number in 1...100 {
    if number.isMultiple(of: 3) && number.isMultiple(of: 5) {
        print("\(number): FizzBuzz")
    } else if number.isMultiple(of: 3) {
        print("\(number): Fizz")
    } else if number.isMultiple(of: 5) {
        print("\(number): Buzz")
    } else {
        print("\(number)")
    }
}
