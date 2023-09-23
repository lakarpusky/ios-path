//
//  ContentView.swift
//  BetterRest
//
//  Created by ☕️ Gabo.montero on 9/17/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = "Your ideal bedtime is:"
    @State private var alertMessage = ""
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(
                wake: Double(hour + minute),
                estimatedSleep: sleepAmount,
                coffee: Double(coffeeAmount)
            )
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is:"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        DatePicker(
                            "Please enter a time",
                            selection: $wakeUp,
                            displayedComponents: .hourAndMinute
                        )
                        .labelsHidden()
                        .onReceive([self.wakeUp].publisher.first(), perform: { _ in
                            calculateBedtime()
                        })
                    } header: {
                        Text("When do you want to wake up?")
                            .font(.headline)
                    }
                    
                    Section {
                        Picker("Number of cups", selection: $coffeeAmount) {
                            ForEach(0..<20) { index in
                                Text("\(index + 1)")
                            }
                        }
                        .onReceive([self.coffeeAmount].publisher.first(), perform: { _ in
                            calculateBedtime()
                        })
                    } header: {
                        Text("Desired amount of sleep")
                            .font(.headline)
                    }
                    
                    Section {
                        Text("\(alertTitle)").foregroundStyle(.secondary)
                        Text("\(alertMessage)").foregroundStyle(.blue)
                    }
                    .font(.system(size: 24))
                    .bold()
                }
                .navigationTitle("BetterRest")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
