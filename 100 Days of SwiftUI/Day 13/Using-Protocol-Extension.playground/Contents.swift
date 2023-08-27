import UIKit


// === How to create and use protocol extensions === //

// .. Protocol Extensions:
// .. we can extend a whole protocol to add method implementations
// .. any types conforming to that protocol get those methods


// .. example:
let guests = ["mario", "luigi", "peach"]

if guests.isNotEmpty {
    print("guest count: \(guests.count)")
}

// .. using an extension
// .. BUT: we can make it available to any type that conforms to "Collection"
// .. Tecnique apple calls: "protocol-oriented programming"

extension Collection {
    var isNotEmpty: Bool {
        !isEmpty
    }
}


// .. exmaple:
protocol Person {
    var name: String { get }
    func sayHello()
}

// .. default implementation
extension Person {
    func sayHello() {
        print("hi, i'm \(name)")
    }
}

// .. conforming types can add their own "sayHello" method if they want
// .. but they don't need to

struct Employee: Person {
    let name: String
}

// .. we could use the default implementation
let taylor = Employee(name: "taylor swift")
taylor.sayHello()
