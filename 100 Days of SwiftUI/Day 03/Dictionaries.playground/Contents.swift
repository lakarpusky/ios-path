import UIKit

// === How to store and find data in dictionaries === //

// .. arrays are a great choice when items should be stored in the order you add them
// .. or when you might have diplicated items in there

// .. BUT: very often accessing data by its position can be annoying or even dangerous

// .. example:
var employee = ["taylor swift", "singer", "nashville"]

// .. an employee: so you might be able to guess what various parts do
print("name: \(employee[0])")
print("job title: \(employee[1])")
print("location: \(employee[2])")

// .. this kind of code would cause serious problems:
// .. you can't really be sure that [2] is their location
// .. there's no guarantee that item 2 is even there

print("name: \(employee[0])")
employee.remove(at: 1)
print("job title: \(employee[1])")
// print("location: \(employee[2])") // FATAL ERROR: index out of range

// .. now prints "nashville" as the job title, which is wrong
// .. and will cause our code crash when it read [2]

// .. swift has a solution for both these problems, called:
// .. "Dictionaries"
// .. don't store items according to their position, but instead let us decide
// .. where items should be stored

// .. example:
let employee2 = [
    "name": "taylor swift",
    "job" : "singer",
    "location" : "nashville"
]

// .. swift calls the string on the left the "keys" to the dictionary
// .. and the strings on the right are the values

// .. when it comoes to reading data out from a dictionary:

print(employee2["name"])
print(employee2["job"])
print(employee2["location"])

// .. swift provides an alternative: when you access data inside a dictionary
// .. it will tell us:
// .. "you might get a value back, but you might get back nothing at all"
// .. swift call these "optionals" because the existence of data is optional

// .. when reading from a dictionary:
// .. you can provide a default value to use if the key doesn't exist

print(employee2["name", default: "unknown"])
print(employee2["job", default: "unknown"])
print(employee2["location", default: "unknown"])

// .. example
let hasGraduated = [
    "eric": false,
    "maeve": true,
    "otis": false
]

// .. example
let olympics = [
    2012: "london",
    2016: "rio janeiro",
    2021: "tokyo"
]

print(olympics[2012, default: "unknown"])

// .. you can also create an empty dictionary usning whatever explicit types
var heights = [String: Int]()
heights["yao ming"] = 229
heights["shaquille o'neal"] = 216
heights["lebron james"] = 206

// .. dictionaries don't allow duplicated keys to exist
// .. if you set a value for a key that already exists:
// .. swift will override whatever was the previous value

var archEnemies = [String: String]()
archEnemies["batman"] = "the joker"
archEnemies["superman"] = "lex luthor"
print(archEnemies)
archEnemies["batman"] = "penguin"
print(archEnemies)
