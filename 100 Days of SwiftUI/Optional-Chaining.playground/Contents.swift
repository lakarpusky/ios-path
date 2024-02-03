import UIKit


// === How to handle multiple optionals using optional chaining === //

// .. simplified syntax for reading optionals inside optionals
// .. example:

let names = ["arya", "bran", "robb", "sansa"]
let chosen = names.randomElement()?.uppercased() ?? "no one"
print("next in line: \(chosen)")

// .. the return value of an optional chain is always an optional
// .. example:

struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "a"
print(author)
