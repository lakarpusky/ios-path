import UIKit

// === How to return values from functions === //


// .. example:
// .. rather than forcing the dice roll to use a 6-sided dice, you could instead make it a:
func rollDice() -> Int {
    return Int.random(in: 1...6) // (*1)
}

let result = rollDice()
print(result)

// .. IMPORTANT: when you say your function will return an "Int", swift will make sure it always
// .. returns an "Int"

// .. example:
// .. accept two string parameters, and return true if their letters are the same:
func areLettersTheSame(letter1: String, letter2: String) -> Bool {
    return letter1.sorted() == letter2.sorted()
}

let checkResult = areLettersTheSame(letter1: "abc", letter2: "bca")
print(checkResult)

// .. (*1) when a function has only one line of code, we can remove the "return" keyword
// .. that line of code "must" return the data you promised to return:
func lettersTheSame(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

let same = lettersTheSame(string1: "mvp", string2: "vip")
print(same)

// .. example:
// .. we can build a "pythagoras()":
func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)

// .. (*1)
func pythagoras2(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c2 = pythagoras(a: 4, b: 8)
print(c2)


// TIP: if you function doesn't return a value, you can still use "return"
// .. by itself to force the function to exit early.


// == How to retun multiple values from functions === //


// .. to return two or more values, you could use an array:
func getUserByArray() -> [String] {
    ["taylor", "swift"]
}

let user = getUserByArray()
print("name: \(user[0]) \(user[1])")

// .. it's hard to rember what user[0] and user[1] are
// .. we could use a dictionary, but that has its own problems:

func getUserByDictionary() -> [String: String] {
    [
        "firstName" : "taylor",
        "lastName" : "swift"
    ]
}

let user2 = getUserByDictionary()
print("name: \(user2["firstName",  default: "none"]) \(user2["lastName", default: "none"])")

// .. both of these solutions are pretty bad
// .. but swift has a solution in the form of tuples:

// .. like arrays, dictionaries, and sets
// .. tuples let us put multiple pieces of data into a single variable,
// .. BUT: unlike those other options tuples have a fixed size and can
// .. have a variety of data types

func getUserByTuples() -> (firstName: String, lastName: String) {
    (firstName: "taylor", lastName: "swift")
}

let user3 = getUserByTuples()
print("name: \(user3.firstName) \(user3.lastName)")

// .. tuples have a key advantage over dictionaries:
// .. we specify exactly which values will exist and what types they have,
// .. whereas dictionaries may or mey not contain the values we're asking for


// .. THERE ARE THREE other things it's important to know when using tuples:


// .. 1. Returning a tuple from a func,
// .. swift already knows the names you're giving each item in the tuple

func getUserByDefault() -> (firstName: String, lastName: String) {
    ("taylor", "Swift")
}


// .. 2. Sometimes you'll find you're given tuples where the elements don't have names
// .. then you can access the tuple's elements using numerical indices starting from "0"
// .. (**) numerical indices are also available with tuples that have names elements

func getUserByIndices() -> (String, String) {
    ("taylor", "swift")
}

let user4 = getUserByIndices()
print("name: \(user4.0) \(user4.1)")


// .. 3. If a func returns a tuple you can pull the tuple apart into individual values
// .. if you want to

func getUserByIndividual() -> (firstName: String, lastName: String) {
    (firstName: "taylor", lastName: "swift")
}

let (firstName, lastName) = getUserByIndividual()
print("name: \(firstName) \(lastName)")


// .. if you don't need all the values from the tuple
// .. you can further by using "_" to tell swift to ignore the part of the tuple

let (firstName2, _) = getUserByIndividual()
print("name: \(firstName2)")
