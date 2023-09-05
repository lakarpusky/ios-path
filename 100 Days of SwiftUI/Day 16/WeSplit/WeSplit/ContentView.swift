//
//  ContentView.swift
//  WeSplit
//
//  Created by ☕️ Gabo.montero on 9/4/23.
//

import SwiftUI

struct ContentView: View {
    // .. property wrapper
    // .. allows that value to be stored separately
    
    @State private var tapCount = 0
    
    // .. for single properties that are stored in one view
    // .. recommends we add "private" access control
    
    @State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    // .. "$": mark the variable for "two-way binding"
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                }
                Section {
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Button("Tap Count: \(tapCount)") {
                    self.tapCount += 1
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
