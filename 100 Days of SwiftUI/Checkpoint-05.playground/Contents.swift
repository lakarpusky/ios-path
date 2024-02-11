import Cocoa

// TOPIC: Checkpoint 05

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// .. 1. filter out any numbers that are even
// .. 2. sort the array in ascending order
// .. 3. map them to strings in the format "7 is a lucky number"
// .. 4. print the result array, one item per line

luckyNumbers
    .filter { $0.isMultiple(of: 2) }
    .sorted { $0 > $1 }
    .map { "\($0) is a lucky number" }
    .forEach { print($0) }
