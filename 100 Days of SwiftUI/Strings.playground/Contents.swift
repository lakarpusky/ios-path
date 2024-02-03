import UIKit

var greeting = "Hello, playground"

// ===== How to create strings ===== //

// .. when you assign text to a "constant" or "variable
let actor = "denzel"

// .. you can use punctuation, emoji and other characters
let filename = "screen.jpg"
let result = "🤦‍♂️ run!"

// .. you can even us other double quotes isnide your string
let quote = "they \"believe\" and walked away"

// .. strings across multiple lines
let movie = """
A day
in
paradise
"""

// .. you can read the length of a string
print(actor.count)
// .. you dont need to print the length directly, you can assign it to another constant
let nameLength = actor.count
print(nameLength)

// .. the second useful piece of functionality is: "uppercased()"
// .. which sends back the same string but every one of its letter is uppercased
print(result.uppercased())

// .. the last piece of helpful functionality is called: "hasPrefix()"
// .. and lets us know whether a string starts with some letters of our choosing
print(movie.hasPrefix("a day"))

// .. there's also a: "hasSuffix" counterpart, with checks whether a string ends with some text
print(filename.hasSuffix(".jpg"))

// *** IMPORTANT: Strings are case-sensitive in Swift
