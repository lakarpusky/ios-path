//
//  ContentView.swift
//  iExpense
//
//  Created by ☕️ Gabo.montero on 10/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    @State private var expenses = Expenses()
    
    let emptyText: some View = Text("Add some expenses to display here :)")
        .foregroundStyle(.secondary)
        .font(.system(size: 14))
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ExpensesList(
                    type: "Personal",
                    items: expenses.items.filter { $0.type == "Personal" },
                    onDelete: removeItems
                )
                ExpensesList(
                    type: "Business",
                    items: expenses.items.filter { $0.type == "Business" },
                    onDelete: removeItems
                )
            }
            .navigationTitle("iExpense")
            .navigationDestination(for: Int.self) { _ in
                AddView(expenses: expenses)
            }
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    path.append(0)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
