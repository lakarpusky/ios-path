import UIKit


// === How to use type annotations === //

// .. sometimes we don't want to assign a value immediately, or
// .. sometimes we want to override swift's choice of type
// .. that's where type annotations come in:

// .. we've been making constants and variables:
// .. this uses "type inference"
let username = "lasso"
var score = 0

// .. type annotations let us be explicit about what types we want:
let surname: String = "surname"
var surscore: Int = 0

// .. we've looked at a few types of data so far:

// .. String: holds text
let playerName: String = "roy"

// .. Int: holds whole numbers
var lukyNumber: Int = 13

// .. Double: holds decimal numbers
let pi: Double = 3.141

// .. Bool: holds either true or false
var isAuth: Bool = true

// .. Array: holds lots of different values, all in order you add them
var albums: [String] = ["red", "faearless"]

// .. Dictionary: holds lots different values,
// .. where you get to decide how data should be accessed
var user: [String: String] = ["id" : "@lakarpusky"]

// .. Set: holds lots of different values, but stores them in an order
// .. that's optimized for checking what it contains
var books: Set<String> = Set([
    "the bluest eyes",
    "foundation",
    "girl, woman, other"
])

// .. knowing all these types is important for times when you
// .. don't want to provide initial values
var teams: [String] = [String]()
var cities: [String] = []

// .. to use type inference
var clues = [String]()

// .. values of an anum have the same type as the enum itself
enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light

// .. regardless of whether you use type inference or type annotation:
// .. Swift must at all times know what data types your constants and variables contain
