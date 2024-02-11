import Cocoa

// TOPIC: How to provide default values for parameters

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 5)
printTimesTables(for: 8)

var characters = ["lana", "pam", "ray", "sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)
