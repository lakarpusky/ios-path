import UIKit


// === How to create your own structs === //


// .. structs let us create our own custom, complex data types,
// .. complete with their own variables and their own func


// .. a simple struct:
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year) by \(artist))")
    }
}

// .. lets make a couple of albums:
let red = Album(title: "red", artist: "taylor swift", year: 2012)
let wings = Album(title: "wings", artist: "bts", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()


// .. where things get more interesting is when:
// .. you want to have values that can change

// .. example:
struct Employee {
    let name: String
    var vacationRemaining: Int
    
    // .. any func that only read data are fine as they are
    // .. BUT any that change data belonging to the struct must be marked with a special "muating" keyword
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("i'm going on vacation!")
            print("days remaining: \(vacationRemaining)")
        } else {
            print("oops! there aren't enough days emaining.")
        }
    }
}

// .. an "employee" instance: we do so using an initializer
var archer = Employee(name: "sterling archer", vacationRemaining: 14)

archer.takeVacation(days: 5)
print(archer.vacationRemaining)

// .. swift silently creates a special func inside the struct called "init()"
var archer2 = Employee.init(name: "sterling archer", vacationRemaining: 14)


// .. TIP:
// .. if you assign a default value to a constant property, that will be removed from the initializer
// .. to assign a default but leave open of overriding it when needed, use a variable property
