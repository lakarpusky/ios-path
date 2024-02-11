import Cocoa

// TOPIC: How to handle errors in functions

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    
    if password.count < 8 { return "OK" }
    else if password.count < 10 { return "Goog" }
    else { return "Excellent" }
}

// .. handling the errors

// .. do
// ..   try func
// .. catch

let str = "123"

do {
    let result = try checkPassword(str)
    print("password rting: \(result)")
} catch PasswordError.short {
    print("please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("there was an error: \(error.localizedDescription)")
}
