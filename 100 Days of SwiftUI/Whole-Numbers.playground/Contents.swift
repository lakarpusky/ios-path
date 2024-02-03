import Foundation

// === How to store whole numbers === //

// .. when you're working with whole numbers sush as 3, 5,
// .. you're working with what Swift calls "integers" or "Int"

// .. making an integer
let score = 10

// .. writing out numbers by hand, it can be hard to see quite what's going on:
let reallyBig = 100000000
// .. you can use underscores, to break up numbers however you want
let reallyBigButUnderscore = 100_000_000

// .. you can also create integers from other integers, using the kinds of arithmetic operators:
let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squareScore = score * score
let halvedScore = score / 2
print(score)

// .. rather than making a new constant each time, swift has some special
// .. operations to adjust the integer somehow and assigns the result back to the original number

var counter = 10
counter = counter + 5
// .. but you can use the shorthand operator:
counter += 5
print(counter)

// .. that does the same thing, just with less typing
// .. we call these: "compound assignment operators"
counter *= 2
print(counter)
counter -= 10
print(counter)
counter /= 2
print(counter)

// .. like strings, integers have some useful functionality attached
// .. for example: "isMultiple(of:)"

let number = 10
print(number.isMultiple(of: 3)) // to find out whether its a multiple of another integer
// .. BUT you can just use the numnber directly if you want:
print(120.isMultiple(of: 3))
