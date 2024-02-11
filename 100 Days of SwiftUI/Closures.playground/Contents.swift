import Cocoa

// TOPIC: How to create and use closures

// .. simple closure
let sayHi = {
    print("hi there!")
}

sayHi()

// .. closure + anonymous function with parameters
let sayHiParameters = { (name: String) -> String in // .. "in" to activate func body
    "hi \(name)!"
}

var team = ["gloria", "suzanne", "piper", "tiffany", "tash"]
let sortedTeam = team.sorted()
print(sortedTeam)

// .. stand alone function as custom predicate
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "suzanne" {
        return true
    } else if name2 == "suzanne" {
        return false
    }
    
    return name1 < name2
}

// .. we can pass functions into other functions
let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

// .. inline closure
team.append("sasha")
let captainFirst = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "suzanne" {
        return true
    } else if name2 == "suzanne" {
        return false
    }
    
    return name1 < name2
})
print(captainFirst)
