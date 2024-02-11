import Cocoa

// TOPIC: How to accept functions as parameters

// .. function to generate an array of integers,
// .. by calling another function repeatedly
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

// .. by passing dedicated function
func generateNumber() -> Int {
    Int.random(in: 1...20)
}
let rolls1 = makeArray(size: 5, using: generateNumber)

// .. if function's final parameter is a function, we can use trailing closure syntax
let rolls2 = makeArray(size: 5) {
    Int.random(in: 1...20)
}

// .. we can make a function to accept multiple function parameters
// .. if one or more the function's final parameters are functions, we can use trailing closure syntax
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("start first work")
    first()
    print("start second work")
    second()
    print("start third work")
    third()
    print("Done!")
}

doImportantWork { // .. first closure
    print("first work!")
} second: { // .. second closure
    print("second work!")
} third: { // .. third closure
    print("third work!")
}
