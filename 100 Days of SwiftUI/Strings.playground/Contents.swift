import Cocoa

// TOPIC: How to create strings

var greeting = "Hello, playground"

let actor = "Denzel"
let filename = "paris.jpg"
let result = "⭐️ You Win! ⭐️"

// .. double quote inside strings
// .. backslash before quotes: \"{value}\"
let doubleQuoteIn = "Then he tapped a sign saying \"Believe\" and walked away."

// .. multiline string
let movie = """
A day in
the life of an
Apple engineer
"""

// .. length of a string
print(actor.count)

// .. uppercase
print(result.uppercased())

// .. start/end with
print(movie.hasPrefix("A day"))
print(filename.hasSuffix(".jpg"))

// .. note: in swift strings are case sensitive
