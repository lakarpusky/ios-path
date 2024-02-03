import UIKit

// === How to store ordered data in arrays === //

// .. let's start with some simple examples:
var beatles = ["john", "paul", "george", "ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

// .. we could read some values out:
print(beatles[0])
print(numbers[1])
print(temperatures[2])

// .. TIP: make sure an item exists at the index you're asking for,
// .. otherwise your code will crash

// .. if your array is variable:
// .. you can modify it after creating it
beatles.append("adrian")

// .. and there's nothing stopping you from adding items more than once:
beatles.append("allen")
beatles.append("adrian")
beatles.append("novall")
beatles.append("vivian")

// .. however:
// .. swift will make sure your array only ever contains one type of data at a time
// temperatures.append("chris") // ERROR: candidate expects value of type "Double"

// ..  swift won't let you mix these two different types together
let firstBeatle = beatles[0]
let firstNumber = numbers[0]
// let notAllowed = firstBeatle + firstNumber // ERROR: "+" cannot be applied to operands of type "String" and "Int"

// .. you can make other kinds of array by specializing it in different ways:
var albums = Array<String>()
albums.append("folklore")
albums.append("fearless")
albums.append("red")

// .. there's a special war to create them:
// .. rather than writing "Array<String>"
var newAlbums = [String]()

// .. swift "type safety" means that it must always know what type of data an array is storing
// .. BUT: if you provide some initial values swift can figure it out for itself
var figureAlbumsOut = ["floklore"]

// .. some useful functionality that comes with arrays
// ..
// .. "count": to read how many items are in an array
// .. "remove(at:)": to remove one item at a specific index
// .. "removeAll": to remove everything

var characters = ["lana", "pam", "ray", "sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters)

characters.removeAll()
print(characters)

// .. you can check whether an array contains a particular item:
let bonMovies = ["casino royale", "spectre", "no time to die"]
print(bonMovies.contains("frozen"))

// .. you can sort an array:
let cities = ["london", "tokyo", "rome", "budapest"]
print(cities.sorted())

// .. you can reverse an array by:
let presidents = ["bush", "obama", "trump", "biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)
