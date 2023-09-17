//
//  ContentView.swift
//  RPS: Rock, Paper, Scissors
//
//  Created by ☕️ Gabo.montero on 9/16/23.
//

import SwiftUI

struct RoundButton: View {
    var text: String
    let systemMove: Int
    let userMove: Int
    let turns = 10
    
    var action: () -> Void
    
    var body: some View {
        Button(text, action: action)
        .disabled(systemMove == 0 || userMove == turns)
        .padding()
        .background(systemMove == 0 && userMove < turns ? .red : userMove == turns ? .gray : .green)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    init(_ text: String, systemMove: Int, _ userMove: Int, action: @escaping () -> Void) {
        self.text = text
        self.systemMove = systemMove
        self.userMove = userMove
        self.action = action
    }
}

struct ContentView: View {
    
    let turns = 10
    
    @State private var wrong = 0
    @State private var userMove = 0
    @State private var right = 0
    
    @State private var win: Bool?
    @State private var systemMove = Int.random(in: 0..<3)
    @State private var systemQuestion = true
    
    var score: Int {
        let value = right - wrong
        return value > 0 ? value : 0
    }
    
    let moves = ["Rock", "Paper", "Scissors"]
    let winninMoves = ["Paper", "Scissors", "Rock"]
    
    func winOrLoseMove(_ move: Int) {
        systemMove == move ? (right += 1) : (wrong += 1)
    }
    
    func winOrLose(toWin: Int, toLose: Int) {
        guard let wannaWin = win else {
            return
        }
        
        winOrLoseMove(wannaWin ? toWin : toLose)
        
        if userMove < turns {
            systemMove = Int.random(in: 0..<3)
            systemQuestion = userMove == turns - 1 ? false : true
            userMove += 1
        }
    }
    
    var body: some View {
        VStack {
            VStack {
                Text("System move".uppercased())
                    .foregroundColor(.secondary)
                
                Text("\"\(moves[systemMove])\"")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .bold()
            }
            .font(.system(size: 24))
            
            Spacer()
            Spacer()
            
            HStack(spacing: 20) {
                RoundButton("Rock", systemMove: 0, userMove) {
                    winOrLose(toWin: 2, toLose: 1)
                }
                RoundButton("Scissors", systemMove: 2, userMove) {
                    winOrLose(toWin: 1, toLose: 0)
                }
                RoundButton("Paper", systemMove: 1, userMove) {
                    winOrLose(toWin: 0, toLose: 2)
                }
            }
            .font(.system(size: 24))
            .foregroundColor(.white)
            
            Spacer()
            Spacer()
            
            VStack(spacing: 16) {
                if userMove < turns {
                    Text("Turn \(userMove + 1) of \(turns)".uppercased())
                } else {
                    Text("Final Score: \(score)".uppercased())
                        .font(.largeTitle)
                    
                    HStack(spacing: 24) {
                        Text("Wrong: \(wrong)".uppercased())
                            .foregroundColor(.red)
                        Text("Right: \(right)".uppercased())
                            .foregroundColor(.green)
                    }
                    .bold()
                    .font(.system(size: 16))
                }
            }
        }
        .padding()
        .alert(
            "\("\"Win\"".uppercased()) or \("\"Lose\"".uppercased())",
            isPresented: $systemQuestion
        ) {
            Button("Lose".uppercased()) { win = false }
            Button("Win".uppercased()) { win = true }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
