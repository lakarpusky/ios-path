import Cocoa

// TOPIC: How to reuse code with functions

func showWelcome() {
    print("welcome to my app!")
    print("by default this prints out a conversation")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want")
}

showWelcome()

// .. parameters are placeholders
func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) * \(number) is \(i * number)")
    }
}

// .. arguments are values
printTimesTables(number: 5, end: 10)
