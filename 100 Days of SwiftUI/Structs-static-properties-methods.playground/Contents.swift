import Cocoa

// TOPIC: Static properties and methods

struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the shool.")
        studentCount += 1
    }
}

School.add(student: "taylor swift")
print(School.studentCount)

// .. if want to mix and match "Static" and "Non-static" properties and methods
// .. from outside the struct: StructName.propertyOrMethodName
// .. within the struct: Self.propertyOrMethodName

// .. self: the current "value" of a struct
// .. Self: the current "type" of the struct

// .. When to use static properties -SEGGESTION-

// .. 1. to organize common data within the app/program
// .. - User settings, app data, shared data
struct AppData {
    static let version = "1.3 beta"
    static let saveFilename = "settings.json"
    static let homeURL = "https://github.com"
}

// .. anywhere then
AppData.version // .. etc

// .. 2. to store sample data for your structs
struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "username", password: "password")
}

// .. then within swiftUI layouts when needed
Employee.example
