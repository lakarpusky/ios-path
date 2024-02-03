import UIKit


// === How to unwrap optionals with nil coalescing === //

// .. third way: "nil coalescing operator" or "??"
// .. lets us unwrap an optional and provide a default value if empty

// .. example:
let captains = [
    "enterpise": "picard",
    "voyayer": "janeway",
    "defiant": "sisko"
]

// .. we can provide a default value for any optional:
let new = captains["serenity"] ?? "N/A"
print(new)

// .. a struct with an optional property:
struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "beowulf", author: nil)
let author = book.author ?? "anonymous"
print(author)

// .. an integer from a string:
let input = ""
let number = Int(input) ?? 0
print(number)

// .. reading a dictionary key will always return an optional
// .. you might want to use "nil coalescing" to ensure you get back a "non-optional"

let scores = ["picard": 8, "data": 7, "troi": 9]
let crusherScore = scores["crusher"] ?? 0
