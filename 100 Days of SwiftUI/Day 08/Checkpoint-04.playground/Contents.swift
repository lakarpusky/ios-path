import UIKit

// .. a func that accepts 1 through 10_000 and
// .. returns the integer square root of that number

// .. 1. you can't use built-in "sqrt()" function or similar
// .. 2. number < 1 or number > 10_000 should throw an "out of bounds" error
// .. 3. only consider integer square roots
// .. 4. can't find the square root, throw a "no root" error

enum SquareRootError: Error {
    case outOfBounds, noRoot
}

func squareRoot(of number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw SquareRootError.outOfBounds
    }
    
    for root in 1...100 {
        if root * root == number {
            return root;
        }
    }
    
    throw SquareRootError.noRoot
}


do {
    let number = 9;
    let result = try squareRoot(of: number)
    print("the square root of \(number) is \(result)")
} catch SquareRootError.outOfBounds {
    print("out of bounds error.")
} catch SquareRootError.noRoot {
    print("no root error.")
} catch {
    print("opps! 😬")
}
