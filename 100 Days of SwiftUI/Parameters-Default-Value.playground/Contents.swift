import UIKit

// === How to provide default values for parameters === //


// .. adding parameters to functions lets us add customization points,
// .. so that functions can operate on different data depending on our needs.


// .. example:
// .. to count up to 10 or 12
func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i)x\(number) is \(i * number)")
    }
}

printTimesTables(for: 2, end: 4)
printTimesTables(for: 5)

// .. default parameter values let us keep flexibility in our
// .. functions without making them annoying to call most of the time

// .. example:
func findDirections(
    from: String,
    to: String,
    route: String = "fastest",
    avoidHighways: Bool = false
) {
    // ..
}

findDirections(from: "london", to: "glasgow")
findDirections(from: "london", to: "glasgow", route: "scenic")
findDirections(from: "london", to: "glasgow", route: "scenic", avoidHighways: true)

// .. shorter, simpler most of the time, but flexible when need it
