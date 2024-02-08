import Cocoa

// TOPIC: How to store ordered data in arrays

var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

// .. array index
print(beatles[0])
print(numbers[1])
print(temperatures[2])

beatles.append("Adrian")
beatles.append("Adrian")

var scores = Array<Int>()
scores.append(100)
scores.append(80)
print(scores[1])

var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

// .. useful functionalities
print(albums.count)
var characters = ["lana", "pam", "ray", "sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters)

characters.removeAll()
print(characters.count)

let bondMovies = ["casino royale", "spectre", "no time to die"]
print(bondMovies.contains("frozen"))

let cities = ["london", "tokyo", "rome", "budapest"]
print(cities.sorted())

let presidents = ["bush", "obama", "trump", "biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)
