//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by ☕️ Gabo.montero on 2/25/24.
//

import SwiftUI

struct ContentView: View {
    let hands = ["rock", "paper", "scissors"]
    
    @State private var moves = 10 {
        didSet {
            if moves == 0 {
                showMessage = true
            }
        }
    }
    
    
    @State private var win = Bool.random()
    @State private var choice = Int.random(in: 0...2)
    @State private var showMessage = false
    @State private var score = 0
    @State private var message = ""
    
    let winHand = [
        "rock": "paper",
        "paper": "scissors",
        "scissors": "rock"
    ]
    
    let loseHand = [
        "rock": "scissors",
        "paper": "rock",
        "scissors": "paper"
    ]
    
    func tapped(_ value: String) {
        let appHand = hands[choice]
        if let hand = win ? winHand[appHand] : loseHand[appHand] {
            if value == hand && moves > 0 {
                score += 1
                message = "Correct! 🥳"
            } else if score > 0 && moves > 0 {
                score -= 1
                message = "Wrong! 🥹"
            }
        }
        showMessage = true
    }
    
    func nextRound() {
        if moves > 0 {
            moves -= 1
        } else {
            moves = 10
            message = "Your final score is \(score)"
        }
        
        message = ""
        win = Bool.random()
        choice = Int.random(in: 0...2)
        showMessage = false
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    Text("App's move").font(.headline.weight(.light))
                    Text(hands[choice].capitalized).font(.subheadline.weight(.semibold))
                }
                Spacer()
                VStack {
                    Text("Player Should Win").font(.headline.weight(.light))
                    Text(win ? "Yes" : "No").font(.subheadline.weight(.semibold))
                }
                Spacer()
            }
            
            Spacer()
            
            HStack(spacing: 10) {
                ForEach(hands, id: \.self) { hand in
                    Button(hand.uppercased()) {
                        tapped(hand)
                    }
                    .buttonStyle(.bordered)
                }
            }
            
            Spacer()
            Text("Moves: \(moves)")
            Text("Player score: \(score)")
                .font(.title.bold())
        }
        .padding()
        .alert(moves > 0 ? "Your answer is" : "Game is over", isPresented: $showMessage) {
            Button(moves > 0 ? "Continue" : "Start Over") {
                nextRound()
            }
        } message: {
            Text(message)
        }
    }
}

#Preview {
    ContentView()
}
