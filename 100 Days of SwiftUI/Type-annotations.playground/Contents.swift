import Cocoa

// TOPIC: How to use type annotations

let surname: String = "Lasso"
let score: Double = 0

let playName: String = "Roy"
let luckyNumber: Int = 13
let pi: Double = 3.141
var isAuth: Bool = true

var albums: [String] = ["red", "fearless"]
var user: [String: String] = ["id": "@lakar"]
var books: Set<String> = Set([
    "the bluest eye",
    "foundation",
    "girl, woman, other",
])

// .. to make an empty array
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

// .. enums
enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light // .. type inference
style = .dark

let username: String
username = "@lakar"
print(username)

// .. Golden Rule: swift must know at all times which data types your constants and variables contains
