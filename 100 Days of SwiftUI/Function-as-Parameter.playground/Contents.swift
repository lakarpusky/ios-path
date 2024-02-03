import UIKit


// === How to accept functions as parameters === //


// .. example:
// .. a func that generates an array of integers by repeating a func a certain number of times

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)


// .. this same functionality works with dedicated func too
func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)


// .. you can make your func accept multiple func parameters:
// .. in which case you can specify multiple trailing closures

func doImportantWork(
    first: () -> Void,
    second: () -> Void,
    third: () -> Void
) {
    print("start first work")
    first()
    print("start second work")
    second()
    print("start third work")
    third()
    print("done!")
}

// .. how that looks
doImportantWork {
    print("first work")
} second: {
    print("second workd")
} third: {
    print("third work")
}
