//
//  ContentView.swift
//  Edutainment
//
//  Created by ☕️ Gabo.montero on 10/3/23.
//

import SwiftUI

struct Question {
    let text: String
    let answer: String
}

struct ContentView: View {
    
    let questions = [5, 10, 20]
    
    @State private var active = false
    
    @State private var questionNumber = 5
    @State private var tableNumber = 0
    
    @State private var questionedFor: [Question] = []
    @State private var answeredBy = ""
    
    func generateQuestions() {
        if !questionedFor.isEmpty {
            questionedFor = [];
        }
        
        for num in 1...questionNumber {
            let number = tableNumber + 2
            questionedFor.append(
                Question(
                    text: "[\(number)x\(num)] What is \(number) times \(num)",
                    answer: ""
                )
            )
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                VStack(alignment: .leading) {
                    Section {
                        Picker("", selection: $tableNumber) {
                            ForEach(0..<11, id: \.self) { num in
                                Button("\(num + 2)") {
                                    tableNumber = num
                                }
                            }
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("Which multiplication table to practice?".uppercased())
                            .font(.system(size: 15))
                    }
                    
                    Divider()
                        .padding()
                    
                    Section {
                        Picker("", selection: $questionNumber) {
                            ForEach(questions, id: \.self) { numQ in
                                Button("\(numQ)") { questionNumber = numQ }
                            }
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("How many questions to be asked for?".uppercased())
                            .font(.system(size: 15))
                    }
                    
                    Divider()
                        .padding()
                    
                    ForEach(questionedFor, id: \.self.text) { question in
                        HStack {
                            Text(question.text)
                            Spacer()
                            TextField("", text: $answeredBy)
                                .border(.secondary)
                                .frame(width: 100)
                                .keyboardType(.decimalPad)
                        }
                        .textFieldStyle(.plain)
                        .padding(0)
                    }
                }
                
                Spacer()
                
                Button("Start Game".uppercased(), action: generateQuestions)
                .background(.mint)
                .foregroundStyle(.white)
                .buttonStyle(.bordered)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .bold()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
