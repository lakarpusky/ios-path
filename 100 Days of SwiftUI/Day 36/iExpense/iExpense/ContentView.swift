//
//  ContentView.swift
//  iExpense
//
//  Created by ☕️ Gabo.montero on 10/15/23.
//

import SwiftUI

class User: ObservableObject {
    // .. we want to notify any views that are watching our class
    // .. that a change has happened, so they can be reloaded
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct User2: Codable {
    let firstName: String
    let lastName: String
}

struct SecondView: View {
    let name: String
    
    // .. allow us to create properties that store values provided to us externally
    @Environment(\.dismiss) var dismiss // .. to dismiss views programmatically
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .navigationTitle("Hello, \(name)")
            .toolbar {
                EditButton()
                Button("Dismiss") {
                    dismiss()
                }
            }
        }
    }
}

struct ContentView: View {
    
    // .. it tells that we're creating a new class instance
    // .. that should be watched for any change announcements
    @StateObject var user = User()
    
    // 1. to track whether the sheet is showing
    @State private var showingSheet = false
    
    // .. read the value back
    //@State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    // .. let us ignore "UserDefaults", and use "@AppStore" rather than "@State"
    // ..
    // .. 1. access "UserDefaults" through "@AppStorage" property wrapper
    // .. 2. works like "@State": when value changes, reflects the new data
    @AppStorage("tapCount") private var tapCount = 0
    
    @State private var user2 = User2(
        firstName: "Gabo",
        lastName: "Montero"
    )
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            Divider().padding()
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            
            Divider().padding()
            
            Button("Tap count: \(tapCount)") {
                tapCount += 1
                // .. to save the number of taps, so when they come back to the app
                // .. they can pick up where they left off
                //UserDefaults.standard.set(self.tapCount, forKey: "Tap")
            }
            
            Divider().padding()
            
            Button("Save User") {
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(user2) {
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
            }
            
            Spacer()
            
            Button("Show Sheet") {
                // 2. to toggle when tapped
                showingSheet.toggle()
            }
            // 3. need to attach our sheet to our view hierarchy
            .sheet(isPresented: $showingSheet) {
                // 4. need to decide what should actually be in the sheet
                SecondView(name: user.firstName)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
