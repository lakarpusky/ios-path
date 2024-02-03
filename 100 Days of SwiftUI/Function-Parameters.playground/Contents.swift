import UIKit


// === How to customize parameter labels === //


// .. defining the parameters for a function wen can add two names:
// .. one for use where the function is called
// .. and one for use inside the function itself

func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

let string = "hello, world"
let result = isUppercase(string: string)

// .. you might loot at "string: string" and see annoying duplication
// .. we can remove the external parameter label:

func isUpper(_ string: String) -> Bool {
    string == string.uppercased()
}

let string2 = "hello, world"
let result2 = isUpper(string)


// .. when external parameter names aren't quite right:
// .. you want to have them, so "_" isn't a good idea

func printTimesTables(number: Int) {
    for i in 1...5 {
        print("\(i)x\(number) is \(i * number)")
    }
}

// .. BUT the call site doesn't read well:
// .. it would be much better like

func printTimes(for number: Int) {
    for i in 1...5 {
        // print("\(i)x\(for) is \(i * for)") // .. although "for" is allowed, it's not allowed inside the func
        print("\(i)x\(number) is \(i * number)")
    }
}

// .. that reads much better
// .. you can say "print times tables for 5", and it makes sense
printTimes(for: 5)

// .. Swift give us two important ways to control paramters names:
// ..
// .. 1. We can use "_" for external parameter name so that it doesn't get used or
// .. 2. Add a second name there so that we have both external and internal parameter names
