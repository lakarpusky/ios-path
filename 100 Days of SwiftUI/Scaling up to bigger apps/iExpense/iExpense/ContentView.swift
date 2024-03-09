//
//  ContentView.swift
//  iExpense
//
//  Created by ☕️ Gabo.montero on 3/7/24.
//

import SwiftUI

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
    @State private var expenses = Expenses()
    @State private var showAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name).font(.headline)
                            Text(item.type).foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        
                        Text(
                            item.amount,
                            format: .currency(
                                code: Locale.current.currency?.identifier ?? "USD"
                            )
                        )
                        .font(
                            .headline.weight(
                                item.amount > 100 ? .semibold : .regular
                            )
                        )
                        .foregroundStyle(
                            item.amount < 10 ? .green : item.amount < 100 ? .blue : .red
                        )
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showAddExpense = true
                }
            }
        }
        .sheet(isPresented: $showAddExpense) {
            AddView(expenses: expenses)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
