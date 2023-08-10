import UIKit

// .. 1. Create an array of strings
// .. 2. Print the number of items in the array
// .. 3. Print also the number of unique items in the array

var names: [String] = ["just", "learning", "swift", "from", "scratch", "but", "just", "learning", "just"]
print("number of items in the array = \(names.count)")

var uniqNames: Set<String> = Set(names)
print("number of unique items in the array = \(uniqNames.count)")
