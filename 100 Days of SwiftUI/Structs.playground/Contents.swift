import Cocoa

// TOPIC: How to create your own structs

// .. structs: allow us to create custom data types
// .. with variables and functions

// .. example
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "red", artist: "taylor swift", year: 2012)
let wings = Album(title: "wings", artist: "bts", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()

// .. what about values that changes
struct Employee {
    // .. properties
    let name: String
    var vacationRemaining: Int
    
    // .. methods
    // .. any function that want to write data, must be marked specially
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("days remaining: \(vacationRemaining)")
        } else {
            print("oops! there aren't enough days remaining.")
        }
    }
}

// .. struct instance
var archer = Employee(name: "sterling archer", vacationRemaining: 14) // .. using an initializer
archer.takeVacation(days: 5)
print(archer.vacationRemaining)
