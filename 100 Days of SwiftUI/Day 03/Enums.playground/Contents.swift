import UIKit


// === How to create and use enums === //

// .. a "anum": short for enumeration
// .. the problem: let the user select a dat of the week

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday

// .. when you have many cases in an enum you can just write "case" once,
// .. then separate each case with a comma:

enum InlineWeekday {
    case monday, tuesday, wednesday, thursday, friday
}

// .. for enums you can skip the enum name after the first assignment:
var inlineDay = Weekday.monday
inlineDay = .tuesday
inlineDay = .friday
