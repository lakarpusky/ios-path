//
//  ExpensesView.swift
//  iExpense
//
//  Created by ☕️ Gabo.montero on 3/23/24.
//

import SwiftUI
import SwiftData

struct ExpensesView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [Expense]
    
    init(expenseType: String, sortOrder: [SortDescriptor<Expense>]) {
        // .. set array with the custom query
        _expenses = Query(filter: #Predicate<Expense> { item in
            if item.type == expenseType || expenseType == "All" {
                return true
            } else {
                return false
            }
        }, sort: sortOrder)
    }
    
    var body: some View {
        List {
            ForEach(expenses) { item in
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
                .accessibilityElement()
                .accessibilityElement(children: .combine)
                .accessibilityLabel("\(item.name) priced at \(item.amount) USD")
                .accessibilityHint("\(item.type) expense")
            }
            .onDelete(perform: removeExpenses)
        }
    }
    
    func removeExpenses(at offsets: IndexSet) {
        for offset in offsets {
            // .. find the object in our query
            let item = expenses[offset]
            // .. delete it from the context
            modelContext.delete(item)
        }
    }
}

#Preview {
    ExpensesView(
        expenseType: "all",
        sortOrder: [
            SortDescriptor(\Expense.name),
            SortDescriptor(\Expense.amount)
        ]
    )
    .modelContainer(for: Expense.self, inMemory: true)
}
