//
//  ContentView.swift
//  WordScramble
//
//  Created by ☕️ Gabo.montero on 9/22/23.
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
    
    func addNewWord() {
        // .. lowercase and trim the word, to make sure we don't add diplicated words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // .. exit if the remaining string is empty
        guard answer.count >= 3 && answer != rootWord else { return }
        
        // .. extra validation to come
        guard isOrigin(word: answer) else {
            wordError(
                title: "Word used already",
                message: "Be more original"
            )
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(
                title: "Word not possibe",
                message: "You can't spell that word from \(rootWord)"
            )
            return
        }
        
        guard isReal(word: answer) else {
            wordError(
                title: "Word not recognized",
                message: "You can't just make them up, you know!"
            )
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        score += answer.count
        newWord = ""
    }
    
    func startGame() {
        // .. 1. find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // .. 2. load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // .. 3. split the string up into an array og strings, splitting on line breaks
                let allWords = startWords.components(separatedBy: "\n")
                
                // .. 4. pick one random word, or use "silkworm" as a sensible default
                rootWord =  allWords.randomElement() ?? "silkworm"
                
                // .. if we are here everything has worked, so we can exit
                return
            }
        }
        
        // .. if were are *here* then there was a problem - trigger a crash and report the error
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOrigin(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        
        let misspelledRange = checker.rangeOfMisspelledWord(
            in: word,
            range: range,
            startingAt: 0,
            wrap: false,
            language: "en"
        )
        
        return misspelledRange.location == NSNotFound
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        TextField("Enter your word", text: $newWord)
                            .textInputAutocapitalization(.never)
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
                .toolbar {
                    Button("Start Game", action: startGame)
                        .bold()
                }
                
                Spacer()
                Text("Score: \(score + usedWords.count)".uppercased())
                    .font(.system(size: 24))
                    .bold()
                    .foregroundStyle(.blue)
            }
        }
        .onAppear(perform: startGame)
        .onSubmit(addNewWord)
        .alert(errorTitle, isPresented: $showingError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(errorMessage)
        }
        
    }
}

#Preview {
    ContentView()
}
