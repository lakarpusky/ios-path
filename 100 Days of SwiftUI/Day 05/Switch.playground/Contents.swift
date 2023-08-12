import UIKit

// === How to use switch statements to checck multiple conditions === //

// .. you can use "if" and "else if" repeatedly to check conditions as manu items as you want,
// .. but it gets a bit hard ro read

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

if forecast == .sun {
    print("a nice day")
} else if forecast == .rain {
    print("an umbrella")
} else if forecast == .wind {
    print("something warm")
} else if forecast == .rain {
    print("school cancelled")
} else {
    print("forecast generator broken!")
}

// .. we can solve all three of those problems using a differente way
// .. of checking conditions called: "switch"

switch forecast {
case .sun:
    print("it should be a nice day")
case .rain:
    print("pack an umbrella")
case .wind:
    print("wear something warm")
case .snow:
    print("shool is cancelled")
case .unknown:
    print("our forecast generator is broken!")
}

// .. if you explicitly want to carry on executing subsequent cases,
// .. use "fallthrough"
// .. (**) not commonly used, but sometimes it can help you avoiding repeating work

let day = 5
print("my true love gave to me...")

switch day {
case 5:
    print("5 golden rules")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 french hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("a partridge in a pear tree")
}
