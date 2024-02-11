import Cocoa

// TOPIC: How to use trailing closures and shorthand syntax

let team = ["gloria", "suzanne", "piper", "tiffany", "tasha"]

// .. inline closure
let sorted = team.sorted(by: { (a: String, b: String) in
    if a == "suzanne" {
        return true
    } else if b == "suzanne" {
        return false
    }
    
    return a < b
})

// .. we don't have to specify the types of the parameters or return type
// .. trailing closure syntax: when a func accepts another func as is parameter
let sorted2 = team.sorted { a, b in
    if a == "suzanne" {
        return true
    } else if b == "suzanne" {
        return false
    }
    
    return a < b
}

// .. swift can automatically provides parameter names
// .. using: shorthand syntax
// .. we this we don't write parameters name, instead
// .. we get automatically specially name variables counting from: $0...$N
let sorted3 = team.sorted {
    if $0 == "suzanne" {
        return true
    } else if $1 == "suzanne" {
        return false
    }
    
    return $0 < $1
}

// .. shorthand syntax
// .. it comes handy for simpler code
// .. we can remove "return" bc is a single line of code 😉
let reverseTeam = team.sorted { $0 > $1 }

// .. when not to use shorthand syntax -SUGGESTION-
// .. - if the closure's body is long
// .. - is counting variables "$0, $1..." are used multiple times
// .. - if you end up with 3 or more parameters

// ..
// .. Examples
// .. trailing closure + shorthand syntax

let tOnly = team.filter { $0.hasPrefix("t") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)
