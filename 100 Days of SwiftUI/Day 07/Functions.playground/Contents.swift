import UIKit

// === How to reuse code with functions === //


// .. functions are designed to let us re-use code easily, with means we don't have to copy
// .. and paste code to get common behaviors.


// .. wen can me our own function that are open to configuration
// .. given a single integer, and calculate the multiplication tables for that from 1 through 12
func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

// .. naming of paremeters cebomes even more important when you have multiple paremters
func printTimesTables1(number: Int, end: Int) {
    for i in 1...end {
        print("\(i)x\(number) is \(i * number)")
    }
}

printTimesTables1(number: 2, end: 5)


// TIP: any data you create isnide a function is automatically destroyed when the function is finished
