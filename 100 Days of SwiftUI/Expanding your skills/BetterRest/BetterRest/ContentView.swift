//
//  ContentView.swift
//  BetterRest
//
//  Created by ☕️ Gabo.montero on 3/3/24.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker(
                        "Please enter a time",
                        selection: $wakeUp,
                        displayedComponents: .hourAndMinute
                    )
                    .labelsHidden() // we don't get a second label for the picker
                }
                
                Section("Desired amount of sleep") {
                    Stepper(
                        "\(sleepAmount.formatted()) hours",
                        value: $sleepAmount,
                        in: 4...12, // limit the values we want to accept
                        step: 0.25 // how far to move the value each time is tapped
                    )
                }
                
                Section("Daily coffee intake") {
                    //Stepper(
                        // .. specialized form of Markdown
                        // .. "cup" needs to be inflected to match whatever is in the variable
                        //"^[\(coffeeAmount) cup](inflect: true)", // auto pluralization by swift
                        //value: $coffeeAmount,
                        //in: 1...20
                    //)
                    Picker("^[\(coffeeAmount) cup](inflect: true)", selection: $coffeeAmount) {
                        ForEach(1...20, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                //Text(Date.now, format: .dateTime.hour().minute())
                //Text(Date.now, format: .dateTime.day().month().year())
                //Text(Date.now.formatted(date: .long, time: .shortened))
            }
            .navigationTitle("Better 😪 \"Rest\"")
            .toolbar {
                Button("Calculate", action: calculateBedTime)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config) // reads in all our data, and will output a prediction
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            // .. to feed our values into Core ML
            // .. how much slkeep they actually need
            let prediction = try model.prediction(
                wake: Int64(hour + minute),
                estimatedSleep: sleepAmount,
                coffee: Int64(coffeeAmount)
            )
            
            // .. to convert that into the time they should go to bed
            let sleepTime = wakeUp - prediction.actualSleep // you can substract a value in seconds directly from a "Date"
            
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        
        showingAlert = true
    }
}

#Preview {
    ContentView()
}
