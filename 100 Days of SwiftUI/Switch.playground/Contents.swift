import Cocoa

// TOPIC: How to use switch statements to check multiple conditions

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("it should be a nice day.")
case .rain:
    print("pack an umbrella.")
case .wind:
    print("wear something warm")
case .snow:
    print("shool is cancelled.")
case .unknown:
    print("our forecast generator is broken!")
}

let place = "Metropolis"

switch place {
case "gotham":
    print("you're batman!")
case "mega-city one":
    print("you're jude dredd!")
case "wakanda":
    print("you're black panther!")
// .. skip switch be exhaustive
default:
    print("who are you!")
}

let day = 5
print("my true love gave to me...")

switch day {
case 5:
    print("5 golden rings")
    fallthrough // ..  allow axecute next case just after
case 4:
    print("3 french hens")
default:
    print("a partridge in a pear tree")
}
