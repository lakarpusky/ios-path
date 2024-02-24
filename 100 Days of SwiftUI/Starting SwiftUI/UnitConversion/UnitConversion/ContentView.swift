//
//  ContentView.swift
//  UnitConversion
//
//  Created by ☕️ Gabo.montero on 2/23/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedUnit = "Celcius"
    @State private var selectedOutUnit = "Kelvin"
    @State private var unitValue: Double = 0
    
    @FocusState private var isFocused: Bool
    
    let units = ["Meters", "Kms", "Feet", "Yard", "Miles"]
    
    var conversion: Measurement<UnitLength> {
        switch selectedUnit {
        case "Meters":
            let meters = Measurement(value: unitValue, unit: UnitLength.meters)
            return toUnit(from: meters)
        case "Kms":
            let kms = Measurement(value: unitValue, unit: UnitLength.kilometers)
            return toUnit(from: kms)
        case "Feet":
            let feet = Measurement(value: unitValue, unit: UnitLength.feet)
            return toUnit(from: feet)
        case "Yard":
            let yard = Measurement(value: unitValue, unit: UnitLength.yards)
            return toUnit(from: yard)
        default:
            let miles = Measurement(value: unitValue, unit: UnitLength.miles)
            return toUnit(from: miles)
        }
    }
    
    func toUnit(from measure: Measurement<UnitLength>) -> Measurement<UnitLength> {
        switch selectedUnit {
        case "Meters":
            return measure.converted(to: UnitLength.meters)
        case "Kms":
            return measure.converted(to: UnitLength.kilometers)
        case "Feet":
            return measure.converted(to: UnitLength.feet)
        case "Yard":
            return measure.converted(to: UnitLength.yards)
        default:
            return measure.converted(to: UnitLength.miles)
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Input Unit", selection: $selectedUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Picker("Output Unit", selection: $selectedOutUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    TextField("Enter a number", value: $unitValue, format: .number)
                        .keyboardType(.numberPad)
                        .focused($isFocused)
                    
                    Text("Conversion Result: \(conversion.formatted())")
                }
            }
            .navigationTitle("Unit Conversion")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if isFocused {
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
