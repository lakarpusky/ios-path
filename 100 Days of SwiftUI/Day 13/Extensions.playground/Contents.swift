import UIKit


// == How to create and use extensions === //

// .. let us add functionality to any type,
// .. whether we created it or someone else created it - even one of Apple's own type -


// .. example:
var quote = "  the truth is rarely pure and never simple  "


// .. trim the whitespace and newlines on either side
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)


// .. let's write an extension to make it shorter
extension String {
    
    // .. to break up into an array of individual lines
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
    
    // .. when returning a new value:
    // .. you should use word endings like "ed" or "ing"
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // .. when we modified the string directly
    mutating func trim() {
        self = self.trimmed()
    }
}

let trim = quote.trimmed()
quote.trim()


// .. can also use extensions to add properties to types:
// .. BUT: they must only be "computed properties", not "stored properties"
// .. REASON: would affect the actual size of the data types - take up more space in memory -

// .. exmaple:
// .. read the "lines" property of any string

let lyrics = """
but i keep cruising
can't stop, won't stop moving
it's like i got this music in my mind
saying it's gonna be alright
"""

print(lyrics.lines.count)

// .. initializer inside an extension, won't disable the automatic memberwise initializer
// .. are also useful for organizing or own code:

// .. 1. Conformance grouping:
// .. adding a protocol conformance to a type as an extension,
// .. adding all the required methods inside that extension.

// .. 2. Purpose grouping:
// .. creating extensions to do specific tasks,
// .. which makes it easier to work with large types.
