import Cocoa

// TOPIC: How to handle missing data with optionals

let opposites = ["mario": "wario", "luigi": "wuigi"]

// .. 1. by using "if let"
if let marioOpposite = opposites["mario"] {
    // .. run if the variable as a value inside
    print("mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("we got a user: \(unwrappedName)")
} else {
    print("the optional was empty.")
}


// TOPIC: How to unwrap optionals with guard

// .. 2. by using "guard let"
func printSquare(of number: Int?) {
    // .. check if there is a value
    guard let number = number else { // .. run if the variable doesn't have a value inside
        print("missing input")
        return // .. requires you to use "return" if the check fails
    }
    // .. if the optional you're unwrapping has a value, you can use it after guard code finishes
    print("\(number) x \(number) is \(number * number)")
}


// TOPIC: How to unwrap optionals with nil coalescing

// .. unwrap the optional, but if it was empty provide a default value instead
let captains = [
    "enterpise": "picard",
    "voyager": "janeway",
    "defiant": "sisko"
]

let new = captains["serenity"] ?? "n/a"

let tvShows = ["archer", "babylon 5", "ted lasso"]
let favorite = tvShows.randomElement() ?? "none"

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "beowulf", author: nil)
let author = book.author ?? "anonymous"
print(author)

let input = ""
let number = Int(input) ?? 0
print(number)


// TOPIC: How to handle multiple optionals using optional chaining

// .. simplify syntax for reading optionals inside optionals
let names = ["arya", "bran", "robb", "sansa"]

// .. if the optional has a value inside, unwrap it then...
let chosen = names.randomElement()?.uppercased() ?? "no one"
print("next in line: \(chosen)")

let book2: Book? = nil
let authorFristLetter = book2?.author?.first?.uppercased() ?? "A"
print(authorFristLetter)


// TOPIC: How to handle function failure with optionals

// .. if all we care about where the function succed or failed, we can use an optional try
// .. "try?":
// .. it will run the function and if it throws no error it will return an optional value
// .. if at any point it throws an error it will comeback as "nil" this means:
// .. we don't get to know exactly what error was throw inside

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("user: \(user)")
}

let user = (try? getUser(id: 23)) ?? "anonymous"
print(user)
