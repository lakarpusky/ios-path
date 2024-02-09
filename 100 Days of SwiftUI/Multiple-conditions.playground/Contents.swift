import Cocoa

// TOPIC: How to check multiple conditions

let age = 16

if age >= 18 {
    print("you can vote in the next election.")
} else {
    print("sorry, you're too young to vote.")
}

let temp = 25

if temp > 20 && temp < 30 {
    print("it's a nice day.")
}

let userAge = 14
let hasParentalConsent = true

if age >= 18 || hasParentalConsent {
    print("you can buy the game!")
}

enum TransportOption {
    case airplane, helicopter, bicycle, car, escooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("let's fly!")
} else if transport == .bicycle {
    print("i hope there's a bike path...")
} else if transport == .car {
    print("time to get stuck in traffic.")
} else {
    print("i'm going to hire a scooter now!")
}
