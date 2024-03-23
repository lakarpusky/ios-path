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
    
    @State private var path = [User]()
    @State private var showingUpcomingOnly = false
    
    // .. we can control an array of sort descriptors
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    
    var body: some View {
        NavigationStack(path: $path) {
            UsersView(
                minimumJoinDate: showingUpcomingOnly ? .now : .distantPast,
                sortOrder: sortOrder
            )
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                EditUserView(user: user)
            }
            .toolbar {
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    // to adjust the sort descriptors array dynamically
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([ // .. lets us attach specific values of our choosing to each picker option
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate)
                            ])
                        
                        Text("Sort by Join Date")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                            ])
                    }
                }
                
                Button(showingUpcomingOnly ? "Show Everyone" : "Show Upcoming") {
                    showingUpcomingOnly.toggle()
                }
                
                Button("Add User", systemImage: "plus") {
                    addSample()
                    //path = [user]
                }
            }
        }
    }
    
    func addSample() {
        let interval: Double = 86400
        
        // .. working with sample data, it's helpful to be able to delete
        try? modelContext.delete(model: User.self) // .. existing data before adding the sample data
        
        let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(interval * -10))
        let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(interval * -5))
        let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(interval * 5))
        let fourth = User(name: "Jhonny English", city: "London", joinDate: .now.addingTimeInterval(interval * 10))
        
        let job1 = Job(name: "Organize sock drawer", priority: 3)
        let job2 = Job(name: "Make plans with Alex", priority: 4)
        
        modelContext.insert(first)
        modelContext.insert(second)
        modelContext.insert(third)
        modelContext.insert(fourth)
        
        first.jobs?.append(job1)
        first.jobs?.append(job2)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: User.self, inMemory: true)
}
