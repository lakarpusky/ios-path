//
//  ContentView.swift
//  WeSplit
//
//  Created by ☕️ Gabo.montero on 2/19/24.
//

import SwiftUI

// .. @Store:
// ...
// .. for simple properties that are stored in one view
// .. allow that value to ve stored separately in a place that can be modified
// .. apple recommends we add "private" access control to those properties

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("hello world")
                    Button("Tap Count: \(tapCount)") {
                        tapCount += 1
                    }
                }
                
                Section {
                    Text("Your name is \(name)")
                    TextField("Enter your name", text: $name) // .. two-way binding
                }
                
                Picker("Select your student", selection: $selectedStudent) { // .. two-way binding
                    ForEach(students, id: \.self) { // .. to be able to identify each item uniquely
                        Text($0)
                    }
                }
            }
            .navigationTitle("SwiftUI")
            navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
