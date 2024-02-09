import Cocoa

// TOPIC: How to customize parameter labels

func rollDice(sides: Int, count: Int) -> [Int] {
    var rolls = [Int]()
    
    for _ in 1...count {
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }
    
    return rolls
}

let rolls = rollDice(sides: 6, count: 4)

func hireEmployee(name: String) {}
func hireEmployee(title: String) {}
func hireEmployee(location: String) {}

// .. Can have two names
//  - One to use outside: when the func it being call
//  - One for inside: the func body itself

// .. adding underscore before the parameter name
// .. we remove the external parameter name
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result = isUppercase(string)

// .. External parameter name:
// .. when you wanna have them, but underscore isn't a good idea
// .. because it just not read naturally

// .. "for": argument label
// .. "number": parameter name
func printTimesTable(for number: Int) {
    for i in 1...5 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTable(for: 5)
