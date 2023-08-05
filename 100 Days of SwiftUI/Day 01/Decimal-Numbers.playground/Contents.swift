import Foundation

// === How to store decimal numbers === /

// .. when you're working with decimals numbers such as 3.1, 5.56,
// .. you're working with what Swift calls "floating-point" numbers

let number = 0.1 + 0.2
print(number)

// .. when you create a "floating-point" number, swift considers it to be a "Double"
// .. Double: "double-precision floating-point number"

// .. Swift allocates twice the amount of storage,
// .. meaning a "Double" can store massive numbers

// .. Swift considers decimals to be a wholly different type of data to integers,
// .. which means you can't mix them together

// .. After all, integers are always 100% accurate, whereas decimals are not
// .. Swift won't let you put the two of them together unless you specifically ask for it to happen

let a = 1
let b = 2.0

// let c = a + b
// (**) ERROR: Binary operator "+" cannot be applied to operands of type "Int" and "Double"

// .. if you want that to happend you need to tell swift explicity that it shpuld either treat
// .. the "Double" inside "b" as an "Int":
let bInt = a + Int(b)
// .. or treat the "Int" inside "b" as a "Double"
let aDouble = Double(a) + b

// .. Swift decides whether you wanted to create a "Double" or an "Int"
// .. based on the number you provide

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

// .. Combined with "Type Safety", this means that once swift has deciced what data type
// .. a constant or variable holds, it must alwas hold that same data type:

var name = "cage"
name = "jhon"
// name = 57 // ERROR: cannot assign value of type "Int" to type "String"

// .. Decimal numbers have the same range of operators and compound assignment operators
// .. as integers:

var rating = 5.0
rating *= 2
print(rating)
