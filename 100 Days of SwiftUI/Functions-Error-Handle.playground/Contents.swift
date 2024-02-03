import UIKit


// === How to handle errors in functions === //


// .. 1. Telling swift about the possible errors that can happen
// .. 2. Writing a function that can flag up errors if they happen
// .. 3. Calling that function, and handling any errors that might happen


// .. example:
// .. to check how strong user password is

// .. we'll flag up a serious error if the password is too short or is obvious
// .. defining the possible errors that might happen

enum PasswordError: Error {
    case short, obvious
}

// .. write a function that will trigger one of those errors
// ..
// .. function that checks the strength of a password:
// .. - really bad - fewer than 5 characters or is extemely well known
// .. - any other - we'll return either "OK", "Good", or "Excellent"

let obvious = "12345"

// .. if a func is able to throw errors without handling them itself
// .. you must mark the func as "throws" before the return type

// .. being marked with "throws" does not mean the func must throw errors, only that it might

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == obvious {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

// .. call the func and handle any errors that might happen
// ..
// .. 1. starting a block that might throw errors, using "do"
// .. 2. calling one or more throwing func, using "try"
// .. 3. handling any thrown errors using "catch"

do {
    let result = try checkPassword(obvious)
    print("password rating: \(result)")
} catch {
    print("there was an error.")
}

// .. when you use "try", you need to be inside a "do" block and
// .. make sure you have one or more "catch" blocks anle to handle any errors

// .. some sircumstances you can use an alternative writen "try!" which does
// .. not required "do" and "catch", but will crash if an error is thrown
// .. - you should use this only if you're absolutely sure an error cannot be thrown

// .. you must always have a "catch" block that is able to handle every kind of error
// .. BUT: you can also catch specific errors as well:

do {
    let result = try checkPassword(obvious)
    print("password rating: \(result)")
} catch PasswordError.short {
    print("please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("there was an error.")
}


// TIP:
// .. most errors thrown by Apple provide a meaningful mesasge
// .. that you can present to your user if needed

// .. swift makes this available using an "error" value
// .. provided inside your "catch" block

// .. it's common to read "error.localizedDescription" to see what happened
