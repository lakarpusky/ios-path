//
//  ContentView.swift
//  iExpense
//
//  Created by ☕️ Gabo.montero on 3/7/24.
//

import SwiftUI
import SwiftData

struct AmountStyled: View {
    let amount: Double
    
    var body: some View {
        Text(
            amount,
            format: .currency(
                code: Locale.current.currency?.identifier ?? "USD"
            )
        )
    }
}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Expense.name) var expenses: [Expense]
    
    @State private var path = [Int]()
    @State private var expenseType = "All"
    
    // .. customizable sort order options
    @State private var sortOrder = [
        SortDescriptor(\Expense.name),
        SortDescriptor(\Expense.amount)
    ]
    
    let types = ["All", "Personal", "Business"]
    
    var body: some View {
        NavigationStack(path: $path) {
            ExpensesView(
                expenseType: expenseType,
                sortOrder: sortOrder
            )
            .navigationTitle("iExpense")
            .navigationDestination(for: Int.self) { _ in
                AddView()
            }
            .toolbar {
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    // .. to adjust the sort descriptors array dynamically
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\Expense.name),
                                SortDescriptor(\Expense.amount)
                            ])
                        Text("Sort by Amount")
                            .tag([
                                SortDescriptor(\Expense.amount),
                                SortDescriptor(\Expense.name)
                            ])
                    }
                }
                
                Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                    // .. to adjust the custom filter dynamically
                    Picker("Filter", selection: $expenseType) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Button("Add Expense", systemImage: "plus") {
                    path = [1]
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Expense.self, inMemory: true)
}
