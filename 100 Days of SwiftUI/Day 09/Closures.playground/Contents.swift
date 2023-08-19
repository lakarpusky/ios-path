import UIKit


// === How to create and use closures === //


// .. closures: a bit like anonymous functions
// .. functions we can create and assign directly to a variable


// .. example:
// .. skip creating a separate function, and just assign the functionality
// .. directly to a constatn or variable

let sayHello = {
    print("hi there!")
}

sayHello()

// .. want the "closure" to accept parameters, they need to be writtem in a special way

// .. the "closure" starts and ends with the braces:
// .. we can't put code outside those braces to control parameters or return value

// .. swift has a neat workaround:
// .. so we can put that same information inside the braces

let sayHelloWithClosure = { (name: String) -> String in
    "hi \(name)!"
}

print(sayHelloWithClosure("taylor"))

// .. a regular func the parameters and return type would come outside the braces

// .. BUT: we can't do that with "closures"
// .. so, "in" is used to mark the end of the parameters and return type
// .. - everything after that is the body of the "closure" itself


// .. functions type example:
// .. func accetps not parameters, returns no value, and does not throw errors

func greetUser() {
    print("hi there!")
}

var greetCopy: () -> Void = greetUser

// .. every function's type depends on the data it receives and sends back
// .. BUT: the names of the data it receives are not parto of the function's type

// .. example:
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "taylor swift"
    } else {
        return "anonymous"
    }
}

// .. when we take a copy the type func doesn't include the "for" external parameter name
let data: (Int) -> String = getUserData
let user = data(1989)

print(user)

// .. external parameter names only matter when we're calling a func directly
// .. NOT when we create a closure
// .. NOT when we take a copy of the func first

// .. example:
// .. call "sorted()", but pasing a closure instead of a func

let team = ["gloria", "suzanne", "piper", "tiffany", "tasha"]

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "suzanne" {
        return true
    } else if name2 == "suzanne" {
        return false
    }
    
    return name1 < name2
})



// === Why are closure parameters inside the braces? === //



// .. both closures and func can take parameters,
// .. BUT the way they take parameters is very different

// .. example:
// .. a func that accepts a string and an integer

func pay(user: String, amount: Int) {
    // ..
}

// .. example:
// .. the same thing written as a closure

let payment = { (user: String, amount: Int) in
    // ..
}


// == How do you return a value from a closure that takes no parameters? === //


// .. example:
// .. closure that accepts one parameter and returns nothing
let paymentVoid = { (user: String) in
    print("paying void \(user)...")
}

// .. example:
// .. closure that accepts one parameter and returns a boolean
let paymentBool = { (value: String) -> Bool in
    print("paying bool \(user)...")
    return true
}

// .. example:
// .. closure that accepts no parameters and returns a boolean
let paymantNoParameters = { () -> Bool in
    print("paying an anonymous person...")
    return true
}
