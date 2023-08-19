import UIKit


// .. already met "sorted()", "filter()", "map()"
// .. - call one, then the other, then the other back to back without using temporary variables


// .. input:
var luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]


// .. 1. filter out any numbers that are even
// .. 2. sort the array in ascending order
// .. 3. map them to strings in the format "7 is a lucky number"
// .. 4. print the resulting array, one item per line\

let numbers = luckyNumbers.filter {
    !$0.isMultiple(of: 2)
}.sorted {
    $0 < $1
}.map {
    "\($0) is a lucky number"
}

for number in numbers {
    print(number)
}
