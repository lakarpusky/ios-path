import Cocoa

// TOPIC: How to create and use enums

// .. define whole new types
enum Weekday {
    case monday, thesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .thesday
day = .friday
