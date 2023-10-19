//
//  ExpensesList.swift
//  iExpense
//
//  Created by ☕️ Gabo.montero on 10/19/23.
//

import SwiftUI

struct ExpensesList: View {
    let type: String
    let items: [ExpenseItem]
    let onDelete: (_ offsets: IndexSet) -> Void
    
    var body: some View {
        Section {
            if items.isEmpty {
                Text("Add some expenses to display here :)")
                    .foregroundStyle(.secondary)
                    .font(.system(size: 14))
            } else {
                ForEach(items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name).font(.headline)
                            Text(item.type)
                                .foregroundStyle(.secondary)
                                .font(.system(size: 15))
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                            .foregroundStyle(item.amount < 10 ? .blue : item.amount < 100 ? .green : .red)
                    }
                }
                .onDelete(perform: onDelete)
            }
        } header: {
            Text("\(type) Expenses")
        }
    }
}
