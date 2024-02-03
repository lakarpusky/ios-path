import UIKit


// === How to handle missing data with optionals === //


// .. Optionals: "this thing might have a value or might not"

let opposites = [
    "mario": "wario",
    "luigi": "waluigi"
]

let peachOpposite = opposites["peach"]
print(peachOpposite)

// .. optionals are like a box that may or may not have something inside
// .. "unwrap": - we need to look inside the box to see if there's a value, and, if there is, take it out and use it -

// .. swift gives two primary ways of unwrapping optionals
// .. will see the most: "if let" syntax

if let marioOpposite = opposites["mario"] {
    print("mario's opposite os \(marioOpposite)")
}

// .. the condition body will only be run if the optional had a value inside
// .. want to add an "else" block:

var username: String? = nil

if let unwrappedName = username {
    print("we got a user: \(unwrappedName)")
} else {
    print("the optional was empty")
}

// .. we can't use an optional value where a "non-optional" is needed
// .. won't let use them without unwrapping them first

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

//print(square(number: number))
// ERROR: the optional integer must be unwrapped

// .. when unwrapping optionals:
// .. it's very common to unwrap them into a constant of the same name

// .. temporarily creating a second constant of the same name,
// .. available only isnide the condition's body:
// .. this is called "shadowing"

if let number = number {
    print(square(number: number))
}
