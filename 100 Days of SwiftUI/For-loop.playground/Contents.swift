import Cocoa

// TOPIC: How to use a for loop to repeat work

let platforms = ["ios", "macos", "tvos", "watchos"]

for os in platforms {
    print("swift works great on \(os).")
}

// .. loop over fixed range
for i in 1...5 {
    print("counting from 1 through 5: \(i)")
    print("the \(i) times table")
    
    for j in 1...10 {
        print("   \(j) x \(i) is \(j * i)")
    }
}

// .. loop over fixed range, exclude last
for i in 1..<5 {
    print("counting from 1 up to 5: \(i)")
}

var lyrics = "haters gonna"

// .. don't care about the loop variable
for _ in 1...5 {
    lyrics += " hate"
}

print(lyrics)
