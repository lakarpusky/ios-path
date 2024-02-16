import Cocoa

// TOPIC: How to create and use extensions

// .. let us add functionalities to any type
extension String {
    // .. naming method:
    // .. 1. if returning a new value it should end in "ed" / "ing"
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // .. ease to modify values in place, over returnning a new value
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

var quote = " this is a new quote "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
quote.trim()

let lyrics = """
This is a text
to show how many
lines can be at one.
"""
print(lyrics.lines.count)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
    // .. if we declare here our custom initializer,
    // .. default memberwise initializer gets disabled, so:
}

// .. this way we can have both, our custom initializer
// .. and default memberwise intializer
extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

// .. default mwmberwise initializer in place
let lotr = Book(title: "LoTR", pageCount: 1178, readingHours: 24)

// .. our custom initializer
let hp = Book(title: "HP", pageCount: 345)
