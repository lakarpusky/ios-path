//
//  ContentView.swift
//  WordScramble
//
//  Created by ☕️ Gabo.montero on 9/22/23.
//

import SwiftUI

struct ContentView: View {
    
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    let input = "a b c"
    let inputBreaks = """
        a
        b
        c
    """
    
    init() {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                print(fileContents)
            }
        }
        
        // .. simple string to array of strings
        let _ = input.components(separatedBy: " ")
        
        // .. into a string array
        let letters = inputBreaks.components(separatedBy: "\n")
        
        // .. one random item from the array
        let letter = letters.randomElement()
        
        // .. to trim all whitespace at the start and end of a string
        let _ = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // .. to check a string for misspelled words
        let word = "swift"
        
        // .. 1: create an instance of "UITextChecker" that we can use to check that string
        let checker = UITextChecker()
        
        // .. 2: we need to tell the checker how much of our string we want to check
        // .. we need to ask swift to create an Objective-C range using the entire length of all our characters
        let range = NSRange(location: 0, length: word.utf16.count)
        
        // .. 3: we can ask our text checker to report where it found any misspellings in our word
        // .. sends back another Objective-C string range, telling us where the misspelling was found
        let misspelledRange = checker.rangeOfMisspelledWord(
            in: word,
            range: range,
            startingAt: 0,
            wrap: false,
            language: "en"
        )
        
        // .. if the Objective-C range comes back as empty, then we get back the special value "NSNotFound"
        // .. we could check our spelling result to see whether there was a mistake or not
        let allGood = misspelledRange.location == NSNotFound
        print("all good \(allGood)")
    }
    
    var body: some View {
        VStack {
            List {
                Section {
                    Text("Static row 1")
                    Text("Static row 2")
                }
                
                ForEach(0..<5) {
                    Text("Dynamic row \($0)")
                }
                
                Section {
                    Text("Static row 3")
                    Text("Static row 4")
                }
            }
            .listStyle(.grouped)
            
            List(0..<5) {
                Text("Dynamic row \($0)")
            }
            
            List(people, id: \.self) {
                Text($0)
            }
            
            List {
                Text("Static row")
                
                ForEach(people, id: \.self) {
                    Text($0)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
