//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by ☕️ Gabo.montero on 3/21/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    // .. sorted by "User" name
    //@Query(sort: \User.name) var users: [User]
    
    // .. filtering so that we only show users whose name contains a capital "R"
    // .. (#Predicate): the test we're going to apply
    @Query(filter: #Predicate<User> { user in // .. called once for each user loaded by SwiftData
        //user.name.contains("R") &&
        //user.city == "London" // .. and who live in "London"
        
        // .. (contains): case-sensitive
        // .. (localizedStandardContains): ignores letter case
        // or
        if user.name.localizedStandardContains("R") {
            if user.city == "London" {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }, sort: \User.name) var users: [User]
    
    @State private var path = [User]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(users) { user in
                NavigationLink(value: user) {
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                EditUserView(user: user)
            }
            .toolbar {
                Button("Add User", systemImage: "plus") {
                    let interval: Double = 86400
                    
                    // .. working with sample data, it's helpful to be able to delete
                    try? modelContext.delete(model: User.self) // .. existing data before adding the sample data
                    
                    let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(interval * -10))
                    let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(interval * -5))
                    let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(interval * 5))
                    let fourth = User(name: "Jhonny English", city: "London", joinDate: .now.addingTimeInterval(interval * 10))
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                    
                    //path = [user]
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: User.self, inMemory: true)
}
