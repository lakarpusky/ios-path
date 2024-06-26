//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by ☕️ Gabo.montero on 2/24/24.
//

import SwiftUI

struct FlagImage: View {
    let name: String
    
    var body: some View {
        Image(name)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct LargeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.secondary)
            .font(.largeTitle.weight(.semibold))
    }
}

extension View {
    func largeTitleStyle() -> some View {
        modifier(LargeTitle())
    }
}

struct ContentView: View {
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var countries = [
        "Estonia",
        "France",
        "Germany",
        "Iceland",
        "Italy",
        "Nigeria",
        "Poland",
        "Spain",
        "UK",
        "Ukraine",
        "US"
    ].shuffled()
    
    @State private var showingScore = false
    @State private var showingFinalScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var questionCount = 8
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes. Top stripe blue, middle stripe black, bottom stripe white.",
        "France": "Flag with three vertical stripes. Left stripe blue, middle stripe white, right stripe red.",
        "Germany": "Flag with three horizontal stripes. Top stripe black, middle stripe red, bottom stripe gold.",
        "Ireland": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe orange.",
        "Italy": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe red.",
        "Nigeria": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe green.",
        "Poland": "Flag with two horizontal stripes. Top stripe white, bottom stripe red.",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red.",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background.",
        "Ukraine": "Flag with two horizontal stripes. Top stripe blue, bottom stripe yellow.",
        "US": "Flag with many red and white stripes, with white stars on a blue background in the top-left corner."
    ]
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            if userScore > 0 {
                userScore -= 1
            }
        }
        showingScore = true
    }
    
    func askQuestion() {
        if questionCount > 1 {
            questionCount -= 1
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        } else {
            questionCount -= 1
            showingFinalScore = true
        }
    }
    
    func resetGame() {
        questionCount = 8;
        userScore = 0
        showingFinalScore = false
    }
    
    var body: some View {
        ZStack {
            RadialGradient(
                stops: [
                    .init(
                        color: Color(red: 0.1, green: 0.2, blue: 0.45),
                        location: 0.3
                    ),
                    .init(
                        color: Color(red: 0.76, green: 0.15, blue: 0.26),
                        location: 0.3
                    )
                ],
                center: .top,
                startRadius: 200,
                endRadius: 700
            )
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.white)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .largeTitleStyle()
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            // .. default behavior is to read out the image names as ther (VoiceOver) label
                            FlagImage(name: countries[number])
                                // .. add text descrition for each of our flags, describing them in enough
                                // .. detail that they can guesses correctly by someone whe has learned them
                                .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(userScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Text("\(questionCount) questions remaining")
                    .foregroundStyle(.white)
                    .font(.subheadline.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Correct answers: \(userScore)")
        }
        .alert("Game ended", isPresented: $showingFinalScore) {
            Button("Start Over", action: resetGame)
        } message: {
            Text("Your final score is \(userScore) 🎉")
        }
    }
}

#Preview {
    ContentView()
}
