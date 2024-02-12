import Cocoa

// TOPIC: How to compute property values dynamically

// .. structs has two kind of properties:
// .. 1. Stored: when you place a value into the struct directly
// .. 2. Computed: re-calculate the value every time is accessed (work like functions)

struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    // .. computed property
    var vacationRemaining: Int {
        // .. read value
        get {
            vacationAllocated - vacationTaken
        }
        
        // .. write new values
        set {
            // .. "newValue" provided by swift
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer = Employee(name: "sterling archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationAllocated)
