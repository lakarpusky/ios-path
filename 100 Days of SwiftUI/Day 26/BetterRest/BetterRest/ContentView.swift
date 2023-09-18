//
//  ContentView.swift
//  BetterRest
//
//  Created by ☕️ Gabo.montero on 9/17/23.
//

import SwiftUI

struct ContentView: View {
    
    let hour: Int
    let minute: Int
    
    // .. 8am today
    let components = Calendar.current.dateComponents(
        [.hour, .minute],
        from: Date.now
    )
    
    init() {
        self.hour = components.hour ?? 0
        self.minute = components.minute ?? 0
    }
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack {
            Stepper(
                "\(sleepAmount.formatted()) hours",
                value: $sleepAmount,
                in: 4...12,
                step: 0.25
            )
            
            DatePicker(
                "Please enter a date",
                selection: $wakeUp,
                in: Date.now...,
                displayedComponents: .date
            )
                .labelsHidden()
            
            // .. the time from a date
            Text(Date.now, format: .dateTime.hour().minute())
            
            // .. the day, month, and year
            Text(Date.now, format: .dateTime.day().month().year())
            
            // .. we can use "formatted()"
            Text(Date.now.formatted(date: .long, time: .shortened))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
