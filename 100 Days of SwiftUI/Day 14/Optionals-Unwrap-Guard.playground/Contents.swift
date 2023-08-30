import UIKit


// === How to unwrap optionals with guard === //


// .. second way unwrapping optionals: "guard let"
// .. example:

func printSquare(of number: Int?) {
    // .. to check a func's inputs are valid
    guard let number = number else {
        print("missing input")
        // .. 1. will always require you to use "return"
        return
    }
    
    // .. 2. "number" is still available outside of "guard"
    
    // .. check passes and the optional has a value inside
    // .. we can use it after the "guard" code finishes
    print("\(number)x\(number) is \(number * number)")
}

// .. So:
// .. "if let": to unwrap optionals so you can process them somehow

// .. "guard let":
// .. to ensure optionals have something inside them, exit otherwise
// .. is designed to exti the current func, loop or condition if the check fails

// .. TIP: can use "guard" with any condition, including ones that don't unwrap optionals
// .. example:

func isEmpty() {
    guard [Int]().isEmpty else { return }
}

// .. use "if let" if you just want to unwrap some optionals,
// .. BUT prefer "guard let" if yu're specifically checking that conditions are correct before continuing
