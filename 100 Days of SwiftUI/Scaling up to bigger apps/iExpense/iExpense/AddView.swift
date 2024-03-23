//
//  AddView.swift
//  iExpense
//
//  Created by ☕️ Gabo.montero on 3/7/24.
//

import SwiftUI
import SwiftData

struct AddView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var name = "Add new expense"
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        Form {
            Picker("Type", selection: $type) {
                ForEach(types, id: \.self) {
                    Text($0)
                }
            }
            
            TextField(
                "Amount",
                value: $amount,
                format: .currency(
                    code: Locale.current.currency?.identifier ?? "USD"
                )
            )
            .keyboardType(.decimalPad)
        }
        .navigationTitle($name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            Button("Save") {
                let item = Expense(name: name, type: type, amount: amount)
                modelContext.insert(item)
                dismiss()
            }
        }
        
        Button("Cancel") {
            dismiss()
        }
    }
}

#Preview {
    NavigationStack {
        AddView()
            .modelContainer(for: Expense.self, inMemory: true)
    }
}
