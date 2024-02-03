import UIKit


// === Static properties and methods === //

// .. example
struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

// .. "static": both belongs to the struct itself,
// .. rather than to individual instances of the struct

School.add(student: "taylor swift")
print(School.studentCount)

// .. to access static code from non-static code, always use your
// .. type's name "School", you can also use "Self" to refer current type

// .. "self": refers to the current value of the struct
// .. "Self": refers to the current type

// .. example:
// .. 1. static properties to organize common data

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

print(AppData.version)

// .. exmaple:
// .. 2. to create struct examples

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "user name", password: "1234")
}

print(Employee.example)
