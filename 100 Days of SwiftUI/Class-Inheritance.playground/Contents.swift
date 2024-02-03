import UIKit


// === How to make one class inherit from another === //


// .. example:
class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    // .. to override the "printSummary" method
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm goin to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let josh = Manager(hours: 10)

robert.work()
josh.work()

// .. if a child class wants to change a method from a parent class,
// .. you must use "override" in the child class.

let novall = Developer(hours: 4)
novall.printSummary()


// .. TIP: if you know for sure your class should not suppport inheritance,
// .. you can mark it as "final".

// .. the class itself can inherit from other things,
// .. but can't be used to inherit from
