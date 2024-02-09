import Cocoa

// TOPIC: How to return multiple values from functions

// .. 🤔
func getUser() -> [String] {
    ["taylor", "swift"]
}

let user = getUser()
print("user by array: \(user[0]) \(user[1])")

// .. 🤔
func getUser2() -> [String: String] {
    ["firstName": "taylor", "lastName": "swift"]
}

let user2 = getUser2()
print("user by dictionary: \(user2["firstName", default: "?"]) \(user2["lastName", default: "?"])")

// ... 👍 by returning tuples
func tuple1() -> (firstName: String, lastName: String) {
     (firstName: "taylor", lastName: "swift")
}

// .. not using the parameter keys in return
func tuple2() -> (firstName: String, lastName: String) {
     ("taylor", "swift")
}

// .. by index
func tuple3() -> (String, String) {
     ("taylor", "swift")
}

let w1 = tuple1()
let w2 = tuple2()
let w3 = tuple3()

// .. OR destructuring
// .. if don't need "lastName"
let (firstName, _) = tuple2()
print("by destructuring: \(firstName)")

print("user by keys: \(w1.firstName) \(w1.lastName)")
print("by keys: \(w2.firstName) \(w2.lastName)")
print("by index: \(w3.0) \(w3.1)")
