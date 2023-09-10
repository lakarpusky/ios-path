//
//  ContentView.swift
//  UnitConversions
//
//  Created by ☕️ Gabo.montero on 9/10/23.
//

import SwiftUI

struct ContentView: View {
    
    let units = ["meters", "kilometers", "feet", "yards", "miles"]
    
    @State private var inputUnitSelected = "feet"
    @State private var outputUnitSelected = "yards"
    @State private var inputValue = 0.0
    
    @FocusState private var inputValueIsFocused: Bool
    
    var totalConversion: Double {
        let inputUnitValue = Measurement(value: inputValue, unit: UnitLength.miles)
        let outputUnitValue = Measurement(value: inputUnitValue.value, unit: UnitLength.yards)
        
        return outputUnitValue.value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Picker("", selection: $inputUnitSelected) {
                    ForEach(units, id: \.self) { unit in
                        Text(unit.capitalized)
                    }
                }.pickerStyle(.segmented)
                
                Picker("", selection: $outputUnitSelected) {
                    ForEach(units, id: \.self) { unit in
                        Text(unit.capitalized)
                    }
                }.pickerStyle(.segmented)
                
                TextField(
                    "Enter a number",
                    value: $inputValue,
                    format: .number
                )
                .keyboardType(.decimalPad)
                .focused($inputValueIsFocused)
                
                Text("Conversion Result \(totalConversion.formatted())")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
