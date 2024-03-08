//
//  AddView.swift
//  iExpense
//
//  Created by ☕️ Gabo.montero on 3/7/24.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    @Environment(\.dismiss) private var dismiss
    
    var expenses: Expenses
    let types = ["Bsiness", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    .textInputAutocapitalization(.never)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField(
                    "Amount",
                    value: $amount,
                    format: .currency(code: "USD")
                )
                .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
            
            Button("Cancel") {
                dismiss()
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
