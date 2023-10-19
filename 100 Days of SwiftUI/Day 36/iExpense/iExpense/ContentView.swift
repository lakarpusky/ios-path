//
//  ContentView.swift
//  iExpense
//
//  Created by ☕️ Gabo.montero on 10/15/23.
//

import SwiftUI

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decoedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decoedItems
                return
            }
        }
        
        items = []
    }
}

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    let emptyText: some View = Text("Add some expenses to display here :)")
        .foregroundStyle(.secondary)
        .font(.system(size: 14))
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
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
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
}

#Preview {
    ContentView()
}
