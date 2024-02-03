import UIKit


// === How to compute property values dynamically === //


// .. Structs can have two kinds of property:
// .. 1. Stored property: is a variable or constant that holds a piece of data inside an isntance of the struct
// .. 2. Computed property: calculates the value of the property dynamically ever time it's accessed

// .. computed properties:
// .. thy are accessed like stored properties, but work like functions

// .. must always have an explicit type
// .. constants cannot be computed properties

// .. example:
struct Employee {
    let name: String
    var vacationRemaning: Int
}

var archer = Employee(name: "sterling archer", vacationRemaning: 15)

// .. we've lost how many days they were originally granted
archer.vacationRemaning -= 5
print(archer.vacationRemaning)
archer.vacationRemaning -= 3
print(archer.vacationRemaning)

// .. we could adjust this to use computed property:
struct ComputedEmploye {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            // .. "newValue":
            // .. automatically provided by swift, and stores whatever value
            // .. the user was trying to assign to the property
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var computedArcher = ComputedEmploye(name: "serling archer")

computedArcher.vacationTaken += 4
computedArcher.vacationRemaining = 5
print(computedArcher.vacationAllocated)
