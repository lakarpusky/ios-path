import Cocoa

// TOPIC: How to make one class inherit from another

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

// .. if you know for sure your class should not support inheritance
// .. you can marked it as `final`
final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
}

final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
    
    // .. if a child class want to change a parent method
    // .. we must use the `override` keyword
    override func printSummary() {
        print("I'm will work sometimes \(hours) hours a day.")
    }
}

let robert = Developer(hours: 8)
let josh = Manager(hours: 10)
robert.work()
josh.work()

let rob = Developer(hours: 8)
rob.printSummary()
