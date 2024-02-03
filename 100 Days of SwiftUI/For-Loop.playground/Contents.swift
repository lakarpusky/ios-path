import UIKit

// === How to use a for loop to repeat work === //

// .. something simple: if we have an array of strings
let platforms = ["ios", "macos", "tvos", "watchos"]

for os in platforms {
    print("swift works great on \(os).")
}

// .. code inside the the braces: loop body
// .. one cycle through the loop body: loop iteration
// .. "os": the loop variable

// .. rather than looping over an array (or set, or dictionary - the syntax is the same!)
// .. you can also loop over a fixed range of numbers:

for i in 1...12 {
    print("5x\(i) is \(5 * i)")
}

// .. you can also put loops inside loops, called "nested loops":
for i in 1...12 {
    print("the \(i) times table:")
    for j in 1...12 {
        print(" \(j)x\(i) is \(j * i)")
    }
    print()
}

// .. similar-but-different type of range that counts up
// .. to but excluding the final number: "..<"

for i in 1..<5 {
    print("counting 1 up to 5: \(i)")
}

// .. TIP: "..<" is really helpul for working with arrays, where we count from "0"
// .. and often want to count up to excluding the number of items in the array

// .. sometimes you want to run some code a certain number of times using a range,
// .. but you don't actually want the loop variable:

var lyric = "haters gonna"

for _ in 1...5{
    lyric += " hate"
}

print(lyric)

// .. when you want only part of a range
// .. swift make them easier to create by letting us specity only part of a range:

let names = ["piper", "alex", "suzanne", "gloria"]
// .. we could read out an individual name:
print(names[0])
// .. with ranges, we can also print a range of values:
// .. that carries a small risk: if our array didn't contain at least four items then "1...3" would fail
print(names[1...3])
// .. we can use a one-sided range to say "give me 1 to the end of the array":
print(names[1...])

// .. ranges are great for counting through specific alues,
// ..  but they are also helpful for reading grpups of items from arrays


// === Types of ranges === //


// .. CLOSED RANGE OPERATOR going from "a...b"

let range: ClosedRange = 0...10
print(range.first!)
print(range.last!)

// .. a closed ragnge operator going from "a...b" defines a range that includes
// .. both "a" and "b" in wich "a" must not be greater than "b"

// .. the closed operator is useful if you'd like to use all the values
for index in 0...2 {
    print("name \(index) is \(names[index])")
}

// .. the different types of operators can also be used to select elements from a collection
let ccRange: CountableClosedRange = 0...2
print(names[ccRange])

// .. swift is smart to detect the countable variant by itself
// .. therefore, you could write:
print(names[0...2])


// .. HALF-OPEN RANGE OPERATOR going from "a..<b"

let hoRange: Range = 0..<10
print(hoRange.first!)
print(hoRange.last!)

// .. defines a range from "a" to "b" but does not include "b"
// .. its named half-open as it contains its first value but not its final value
// .. the value of "a" must not be greater than "b"

// .. can be used to iterate over zero-based lists such as arrays
// .. and collections in which you want to iterate up to but not including the length of the list
print(names[0..<names.count])


// .. ONE-SIDED OPERATOR going from "a..."

// .. only defines one side of the bounds: "a..." or "...b"
// .. a one-sided range goes as far as possible in one direction:
print(names[...2])
// .. or taking all the elements starting from index "1" till the end of the array
print(names[1...])

// .. a one-sided range can be used for iteration but only if used with a starting value "a..."
// .. otherwise, it's unclear where the iteration should start

// .. iterating over a one-sided range requireds you to manually check where the loop
// .. should end, as it would otherwise continue indefinitely:

let neededNames = 2
var collectedNames: [String] = []

for index in 0... {
    guard collectedNames.count != neededNames else { break }
    collectedNames.append(names[index])
}

print(collectedNames)
