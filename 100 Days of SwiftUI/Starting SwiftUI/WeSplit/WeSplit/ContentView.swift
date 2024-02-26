//
//  ContentView.swift
//  WeSplit
//
//  Created by ☕️ Gabo.montero on 2/19/24.
//

import SwiftUI

// .. @Store:
// ...
// .. for simple properties that are stored in one view
// .. allow that value to ve stored separately in a place that can be modified
// .. automatically watches for changes, it will automatically re-invoke the body property
// .. apple recommends we add "private" access control to those properties

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    // .. behave like @State, but designed to handle input focus
    @FocusState private var amountIsFocused: Bool
    
    // .. calculating the total per person
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2) // .. how many people ther are
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let granTotal = checkAmount + tipValue
        
        // .. amount per person
        return granTotal / peopleCount
    }
    
    // .. total amount for the check
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        
        return checkAmount + tipValue
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: $checkAmount,
                        // .. ask it to treat the input as a currency
                        // .. ask iOS if it can give us the currency code for the current user
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "USD"
                        )
                    )
                    // .. to show a numeric keyword
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    
                    // .. how many people will share the check
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    // .. moves the user to a new screen to select their option
                    .pickerStyle(.navigationLink)
                }
                
                // .. set the section title
                Section("How much tip do you want to leave?") {
                    // .. select how much tip they want to leave
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Amount per person") {
                    Text(
                        totalPerPerson,
                        // .. to format the number as a currency
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "USD"
                        )
                    )
                }
                
                Section {
                    Text("Total amount for the check: \(totalAmount.formatted())")
                        .foregroundStyle(tipPercentage > 0 ? .black : .red)
                }
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
            // .. add toolbar button when text field is active
            .toolbar { // .. specify toolbar items for a view
                if amountIsFocused {
                    Button("Done") {
                        // .. to false so that the keyboard is dismissed
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
