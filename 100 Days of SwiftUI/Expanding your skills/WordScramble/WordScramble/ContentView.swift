//
//  ContentView.swift
//  WordScramble
//
//  Created by ☕️ Gabo.montero on 3/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    @State private var score = 0
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never) // we can disable text capitalization
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord) // .. triggered when any text is submitted
            .onAppear(perform: startGame) // .. runs a closure when a view is shown
            // .. if you don't include any buttons,
            // .. you automatically get a simple "OK" button that dismisses the alert
            .alert(errorTitle, isPresented: $showingError) { } message: {
                Text(errorMessage)
            }
            .toolbar {
                Button("Start Game", action: startGame)
            }
            
            Text("Score: \(score) ptos")
                .font(.title.weight(.semibold))
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
        }
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func addNewWord() {
        // .. lowercase and trim word, to avoid duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // .. exit if string is empty
        guard answer.count > 0 else { return }
        
        // .. exit if shorter than three letters
        guard answer.count > 3 else {
            wordError(title: "Word too short", message: "Only wordw larger than three letters")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        score += answer.count
        // .. we could animate that by:
        withAnimation {
            usedWords.insert(answer, at: 0) // adding always on top
        }
        newWord = ""
    }
    
    // .. whether the word has been used before or not
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    // .. a random word can be made out of the letters from another random word?
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            // .. check each letter to see if that letter exists in our copy
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos) // .. if it does, we remove it from the copy (can't be used twice)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        // .. scanning strings for misspelled words
        let checker = UITextChecker() // from UIKit, to bride strings to Cbjective-C strings safely
        let range = NSRange(location: 0, length: word.utf16.count) // .. to scan the entire length of our string
        let misspelledRange = checker.rangeOfMisspelledWord(
            in: word,
            range: range,
            startingAt: 0,
            wrap: false,
            language: "en"
        ) // .. looks for wrong words
        
        // .. where the misspeled word was found
        return misspelledRange.location == NSNotFound // .. if word was OK, range location will be "NSNotFound"
    }
    
    // .. load everything for the game
    func startGame() {
        // 1. find the URL for "start.txt" file in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. load file content into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. split string up into an array of strings
                let allWords = startWords.components(separatedBy: "\n") // .. splitting on line breaks
                // 4. pick one random word
                rootWord = allWords.randomElement() ?? "silkworm" // .. use it as a sensible default
                
                newWord = ""
                usedWords = []
                score = 0
                // .. worked! so we can exit
                return
            }
        }
        
        // .. failed! trigger a crash and report the error
        fatalError("Could not load \"start.txt\" file from bundle.")
    }
}

#Preview {
    ContentView()
}
