import Cocoa

// TOPIC: Checkpoint 04

// .. Write a func that accepts an int from 1 through 10,000 and retutns the int square root of that number
// ..   - you can't user the built-in "sqrt" function or similar
// ..   - if the number is less that 1 or greater that 10,000 you shuld thow an "out of bounds" error
// ..   - you should only consider int square roots
// ..   - if you can't find the square root, throw a "no root" error

enum SquareRootError: Error {
    case outOfBounds, noRoot
}

func squareRootNumber(of number: Int = Int.random(in: 1...10_000)) throws -> Int {
    if number < 0 || number > 10_000 {
        throw SquareRootError.outOfBounds
    }
    
    for n in 1...100 {
        if n * n == number {
            return n
        }
    }
    
    throw SquareRootError.noRoot
}

do {
    let root = 25
    let result = try squareRootNumber(of: root)
    print("square root number of \(root) is \(result)")
} catch SquareRootError.outOfBounds {
    print("out of bounds error.")
} catch SquareRootError.noRoot {
    print("no root found error.")
} catch {
    print("there was an error: \(error.localizedDescription)")
}
