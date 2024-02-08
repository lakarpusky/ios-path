import Cocoa

// TOPIC: Checkpoint 02

// - Create an array of strings, then write some code that prints the number of
// ..items in the array and also the number of unique items in the array

let items = ["write", "some", "write", "prints", "number", "items"]
print("There are \(items.count) items.")

let uniqueItems = Set(items)
print("There are \(uniqueItems.count) unique items.")
