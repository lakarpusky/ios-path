import UIKit


// === How to handle func failure with optionals === //


// .. if all we care about is whether the func succeeded or failed
// .. we can use optional try:

// .. this means we don't get to know exactly what error was thrown
// .. - we might just care if the func worked or not -

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    // .. we don't actually care what error has thrown
    // .. all we care about is whether the call sent back a user or not
    throw UserError.networkFailed
}

// .. "try?": makes the func return an optional string
// .. which will be "nil" if any errors are thrown

if let user = try? getUser(id: 23) {
    print("user: \(user)")
}

// .. "try?" is mainly used in three places:

// .. 1. with "guard let" to exit func if the "try?" returns "nil"
// .. 2. with "nil coalescing" to attempt something or provide a default value on failure
// .. 3. when calling any throwing func without a return value - when you do't care if it succeeded or not -
