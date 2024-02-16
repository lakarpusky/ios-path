import Cocoa

// TOPIC: How to create and use protocol extensions

// .. protocols let us define contracts to which any conforming type must match
// .. extensions let us add functionality to existing types

// .. extending protocols
// .. a.k.a Protocol Oriented Programming (PoP)

// .. adding functionality to common protocol conformed by Array, Dictionary, etc
// .. otherwise it needs to be implemented in each type
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guets = ["mario", "luigi", "peach"]

if guets.isNotEmpty {
    print("guts count: \(guets.count)")
}


protocol Person {
    var name: String { get }
    func sayHello()
}

// .. defining default implementation for "sayHello"
extension Person {
    func sayHello() {
        print("Hi, I'm \(name)") // .. "name" is available bc is required in "Person" protocol
    }
}

struct Employee: Person {
    let name: String // .. we define the name,
    // .. but not the "sayHello" function bc we can use
    // .. the one defined within the extension
}

let taylor = Employee(name: "taylor")
taylor.sayHello()
