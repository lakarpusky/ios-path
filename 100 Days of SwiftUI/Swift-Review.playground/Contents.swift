import UIKit


// .. creating constants and variables
var name = "ted"
name = "rebecca"

// .. don't want to change a value, use a constant instead
let user = "daphne"



// .. STRINGS: are case-sensitive

// .. start and end with double quotes
let actor = "tom cruise"

// .. double quotes isnide your string
let quote = "he tapped a sign saying \"belieave\" and walked away."

// .. string that spans multiple lines
let movie = """
a day in
the life of an
apple engineer
"""

// .. string stars or ends with
quote.hasPrefix("he")
quote.hasSuffix("Away.")



// .. INTEGERS:

// .. stores whole numbers using the type "Int"
let score = 10
let higherScore = score + 10
let halvedScore = score / 2

// .. support compound assignment operators
var counter = 10
counter += 5

// .. own useful functionality
let number = 120
number.isMultiple(of: 3)

// .. random integers
let id = Int.random(in: 1...1000)



// .. DECIMALS:
// .. number with a decimal ppoint

// .. "Double" to bve a wholly different type of data to "Int",
// .. and won't let you mix them together
let scored = 3.0



// .. BOOLEANS:

// .. type "Bool" to store true or false
let goodDogs = true
let gameOver = false

// .. flip a boolean from true to false by:
var isSaved = false
isSaved.toggle()



// .. JOINING STRINGS:

// .. using "string interpolation"
let namet = "taylor"
let age = 26
let message = "i'm \(name) and i'm \(age) years old."



// .. ARRAYS:

// .. group items into
var colors = ["red", "green", "blue"]
let numbers = [4, 8, 15, 16]
var readings = [0.1, 0.5, 0.8]

// .. Tip: make sure an items exists at the index you're asking for, otherwise your code will crash

// .. if your array is "var", you can:
colors.append("tartan")

// .. have useful functionality
colors.remove(at: 0)
colors.count

// .. check whether an array contains a particular item by
colors.contains("octarine")



// .. DICTIONARIES:

// .. store multiple values according to a ket we specify
let employee = [
    "name": "taylor",
    "job": "singer"
]

// .. to read data, use the same keys you used when creating it
employee["name", default: "unknown"]
employee["job", default: "unknown"]



// .. SETS:

// .. similar to arrays, except you can't add duplicated items
// .. don't store items in a particular order
var snumbers = Set([1, 1, 3, 5, 7])

// .. adding items by:
snumbers.insert(10)



// .. ENUMS:

// .. set of named values we can create and use to make our code more efficient and safer
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

// .. make instances of that enum
var day = Weekday.monday
day = .friday



// .. TYPE ANNOTATIONS:

// ..try to force a specific type for a new variable or constant by
var scoreta: Double = 0

// .. some type annotations based on the types covered so far
let player: String = "roy"
var luckyNumber: Int = 13
let pi: Double = 3.141
var isEnabled: Bool = true
var albums: Array<String> = ["red", "fearless"]
var userd: Dictionary<String, String> = ["id": "@lakarpusky"]
var books: Set<String> = Set(["the bluest eye", "foundation"])

// .. knowing the exact types is important for creating empty collections
var teams: [String] = [String]()
var clubs = [String]()

// .. values of an enum have the same type as the enum itself
enum UIStyle {
    case light, dark, system
}

var style: UIStyle = .light



// .. CONDITIONS:

// .. "if", "else", and "else if" statements to check a condition
let agec = 16

if agec < 12 {
    print("")
} else if agec < 18 {
    print("")
} else {
    print("")
}

// .. to combine two conditions
let temp = 26

if (temp > 20 && temp < 30) || temp > 4 {
    print("")
}



// .. SWITCH STATEMENTS:

// .. check a value against multiple conditions
enum Weather {
    case sun, rain, wind
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("")
case .rain:
    print("")
default:
    print("")
}

// .. must be exhaustive:
// .. all possible values must be handled so you can't miss one by accident



// .. TERNARY CONDITIONAL OPERATOR:

// .. let us check a condition and retun one of two values
let agetco = 18
let canVote = agetco >= 18 ? "yes" : "no"



// .. LOOPS:

// .. "for" loops run some code for every item in a collection
let platforms = ["ios", "macos", "tvos", "watchos"]

for os in platforms {
    print("os \(os)")
}

// .. can also loop over range of numbers:
for i in 1...2 {
    print("is \(5 * i)")
}

// .. if want to exclude the final number:
for i in 1..<3 {
    print("is \(5 * i)")
}

// .. Tip: don't need the loop variable
var lyric = "haters gonna"

for _ in 1...2 {
    lyric += " hate"
}

// .. there are also "while" loops
// .. execute until a condition is false
var countw = 2

while countw > 0 {
    print("\(countw)...")
    countw -= 1
}

// .. "continue" to skip the current loop iteration
let files = ["me.jpg", "work.txt", "sophie.jpg"]

for file in files {
    if !file.hasPrefix(".jpg") {
        continue
    }
    
    print("found picture: \(file)")
}

// .. alternatively, use "break" to exit a loop and skip all remaining iterations



// .. FUNCTIONS:

// .. to create a new function, write "func"
func printTimesTables(number: Int) {
    for i in 1...2 {
        print("is \(i * number)")
    }
}

printTimesTables(number: 2)

// .. to return data from a function
// .. tell what type it is, then use the "return" keyword to send it back
func rollDice() -> Int {
    return Int.random(in: 1...6) // .. only a single line of code, you can remove the "return" keyword
}

let result = rollDice()



// .. RETURNING MULTIPLE VALUES FROM FUNCTIONS:

// .. tuples store a fixed number of values of specific types
// .. a convenient way to return multple values from a function:
func getUser() -> (first: String, last: String) {
    (first: "taylor", last: "swift")
}

let userdp = getUser()
print("name: \(userdp.first) \(userdp.last)")

// .. if don't need all the values from the tuple you can
// .. destructure the tuple to pull it apart into individual values
let (first, _) = getUser()
print("name: \(first)")



// .. CUSTOMIZING PARAMETER LABELS:

// .. you don't want to pass a parameter's name when calling a function
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "hello, world"
let resultcpl = isUppercase(string)

// .. an alternative is to write a second name before the first:
// .. one to use externally, and one internally
func printTimesTables2(for number: Int) {
    for i in 1...12 {
        print("is \(i * number)")
    }
}

// .. "for" is used externally, and "number" is used internally
printTimesTables2(for: 2)



// .. PROVIDING DEFAULT VALUES FOR PARAMETERS:

// .. we can provide default parameter values
func greet(_ person: String, formal: Bool = false) {
    if formal {
        print("welcome, \(person)")
    } else {
        print("hi, \(person)")
    }
}

// .. we can call it in two ways
greet("tim", formal: true)
greet("taylor")



// .. HANDLING ERRORS IN FUNCTIONS:

// .. to handle errors in functions you need to tell which errors can happen
// .. write a function that can throw errors
// .. then call it and handle any problems

// .. first, define the errors that can occur
enum PasswordError: Error {
    case short, obvious
}

// .. next, write a function that can throw errors
// .. by placing "throws" into the function's type
// .. then by using "throw" to trigger a specific errors
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "1234" {
        throw PasswordError.obvious
    }
    
    if password.count < 10 {
        return "ok"
    }
    
    return "good"
}

// .. now call the throwing function by starting a "do" block
// .. calling the function using "try"
// .. then catching errors that occur:
let stringheif = "1234"

do {
    let result = try checkPassword(string)
    print("rating \(result)")
} catch PasswordError.obvious {
    print("same combution")
} catch {
    print("was an error")
}



// .. CLOSURES:

// .. you can assign functionality directly to a constant or variable
let sayHello = {
    print("hi there!")
}

sayHello()

// .. "sayHello" is a closure
// .. - a chunk of code we can pass around and call whenever we want -
// .. if you want the closure to accept parameters:
let sayHello2 = { (name: String) -> String in
    "hi \(name)"
}

// .. the "in" is used to mark the end of the parameters and return type
// .. - everything after that is the body of the closure itself -

// .. filter through a test
// .. we can provide that test using a closure:
let team = ["gloria", "suzanne", "tiffany", "tasha"]

let onlyT = team.filter({ (name: String) -> Bool in
    return name.hasPrefix("T")
})



// .. TRAILING CLOSURES AND SHORTHAND SYNTAX

let onlyTT = team.filter({ (name: String) -> Bool in
    name.hasPrefix("T")
})

// .. we don't need to specify the types in our closure
let onlyT2 = team.filter({ name in
    name.hasPrefix("T")
})

// .. can go further using special syntax "trailing closure syntax"
let onlyT2T = team.filter { name in
    name.hasPrefix("T")
}

// .. can provide short parameter names
let only2T = team.filter {
    $0.hasPrefix("T")
}



// .. STRUCTS

// .. let us create our own custom data types
struct Album {
    let title: String
    let artist: String
    var isReleased = true
    
    func printSummary() {
        print("\(title) by \(artist)")
    }
    
    // .. want a method change one of its properties
    // .. mark it as mutating:
    mutating func removeFromSale() {
        isReleased = false
    }
}

let red = Album(title: "red", artist: "taylor swift")
print(red.title)
red.printSummary()



// .. COMPUTED PROPERTIES

// .. calculates its value every time it's accessed
struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    // .. to be able to write we need to provide both a getter and a setter
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            // .. "newValue" stores whatever value the user was assigning to the property
            vacationAllocated = vacationTaken + newValue
        }
    }
}



// .. PROPERTY OBSERVERS

// .. pieces of code that run when properties change

// .. "didSet": runs when the property just changed
// .. "willSet": runs before the property changed
struct Game {
    var score = 0 {
        didSet {
            print("score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3



// .. CUSTOM INITIALIZERS

// .. special functions that prepare a new struct instance to be used, ensuring all
// .. properties have an initial value

// .. swift generates one based on the struct's properties
// .. BUT you can create your own:
struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}



// .. ACCESS CONTROL

// .. the most common:
// ..
// .. "private": don't let anything outside the struct use this
// .. "private(set)": anything outside the struct can read this, but don't let them change it
// .. "fileprivate": don't let anything outside the current file use this
// .. "public": let anyone, anywhere use this
struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        }
        return false
    }
}



// .. STATIC PROPERTIES AND METHODS

// .. to add a property or method directly to the struct itself rather than to one instance of the struct
struct AppData {
    static let version = "1.3 beta 2"
    static let settings = "settings.json"
}



// .. CLASSES

// .. let us create custom data types

// .. 1. we can create classes by inheriting functionality
class Employeee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("i work \(hours) hours a day.")
    }
}

class Developer: Employeee {
    func work() {
        print("i'm coding for \(hours) hours.")
    }
    
    // .. child class wants to change a method from a parent class, it must use "override"
    override func printSummary() {
        print("i spend \(hours) hours a day searching ")
    }
}

let novall = Developer(hours: 5)
novall.work()
novall.printSummary()

// .. 2. won't auto generate a memberwise initializer for classes
// .. .. child initializers, must always call the parent's initializer
// .. .. if a subclass doesn't have any initializers, it automatucally inherits of its parent class
class Vehiclee {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehiclee {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

// .. 3. all copies of a class instance share their data
// .. .. changes you make to one will automatically change other copies
class Singeer {
    var name = "adele"
}

var singer2 = Singeer()
var singer3 = singer2
singer3.name = "justin"
print(singer2.name)
print(singer3.name)

// .. 4. classes have a "deinitializer" that gets called when the lats reference to an object is destroyed
class Useer {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("user \(id): i'm alive")
    }
    
    deinit {
        print("user \(id): i'm dead")
    }
}

for i in 1...3 {
    let user = Useer(id: i)
    print("user \(user.id): i'm in control")
}

// .. 5. classes let us change variable properties even when the class itself is constant
// .. .. classes don't need the "mutating" keyword with methods
class Uuser {
    var name = "paul"
}

let uuser = Uuser()
uuser.name = "taylor"
print(uuser.name)



// .. PROTOCOLS

// .. define functionality we expect a data type to suppport
protocol Veehiclee {
    // .. can also require properties
    var name: String { get }
    var currentPassengers: Int { get set }
    func estiamteTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Caar: Veehiclee {
    let name = "caar"
    var currentPassengers = 1
    
    func estiamteTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("i'm driving \(distance)km")
    }
}

// .. a func taht accepts any kind of type that conforms to
func commute(distance: Int, using vehicle: Veehiclee) {
    if vehicle.estiamteTime(for: distance) > 100 {
        print("too slow")
    } else {
        vehicle.travel(distance: distance)
    }
}

let caar = Caar()
commute(distance: 100, using: caar)



// .. EXTENSIONS

// .. let us add functionality to any type
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

var quotee = "  the truth is rarely pure and never simple  "
let trimmed = quote.trimmed()

// .. to change a value directly rather than returning a new value
extension String {
    mutating func trim() {
        self = self.trimmed()
    }
}

quotee.trim()

// .. can also add computed properties to types
extension String {
    var lines: [String] {
        // .. splits a string into an array of strings using a boundary
        self.components(separatedBy: .newlines)
    }
}

// .. using that property
let lyriccs = """
but i keep cruising
can't stop, won't stop moving
"""

print(lyriccs.lines.count)



// .. PROTOCOL EXTENSIONS

// .. extend a whole protocol to add computed properties and method implmentations
extension Collection {
    var isNotEmpty: Bool {
        !isEmpty
    }
}

// .. we can put it to use
let guests = ["mario", "luigi", "peach"]

if guests.isNotEmpty {
    print("guest count: \(guests.count)")
}



// .. OPTIONALS

// .. represent the abscence of data
let opposites = [
    "mario": "wario",
    "luigi": "waluigi"
]

let peachOpposite = opposites["peach"]

if let marioOpposite = opposites["mario"] {
    print("mario's opposite is \(marioOpposite)")
}

// .. unwrapping optionals with gaurd
func printSquare(of number: Int?) {
    guard let number = number else {
        print("missing input")
        return
    }
    
    print("\(number)x\(number) is \(number * number)")
}

// .. nil coalescing operator
let tvShows = ["archer", "babylon 5", "ted lasso"]
let favorite = tvShows.randomElement() ?? "none"

let inputt = ""
let nuumber = Int(inputt) ?? 0
print(nuumber)

// .. optional chaining
let naames = ["arya", "bran", "robb", "sansa"]
let choosen = naames.randomElement()?.uppercased()
print("next in line: \(choosen ?? "no one")")

// .. optional try?

// .. calling a func that might throw errors,
// .. we can use "try?" to convert its result into an optional containing a value on success, or "nil" otherwise
enum UuserError: Error {
    case badID, networkFailed
}

func getUuser(id: Int) throws -> String {
    throw UuserError.networkFailed
}

if let uuser = try? getUuser(id: 23) {
    print("user: \(uuser)")
}
