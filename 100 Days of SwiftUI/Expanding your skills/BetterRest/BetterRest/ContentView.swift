//
//  ContentView.swift
//  BetterRest
//
//  Created by ☕️ Gabo.montero on 3/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    let now = Date.now
    let tomorrow = Date.now.addingTimeInterval(86400) // number of seconds in a day
    
    let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
    //let hour = components.hour ?? 0
    //let minute = components.minute ?? 0
    
    var body: some View {
        VStack {
            Stepper(
                "\(sleepAmount.formatted()) hours",
                value: $sleepAmount,
                in: 4...12, // limit the values we want to accept
                step: 0.25 // how far to move the value each time is tapped
            )
            
            DatePicker(
                "Please enter a date",
                selection: $wakeUp,
                // .. will allow all dates in the future, but none in the past
                // .. - from current date up to anything -
                in: Date.now..., // "one-side" range, we specify either the start or end but not both
                displayedComponents: .hourAndMinute
            )
            .labelsHidden()
            
            Text(Date.now, format: .dateTime.hour().minute())
            Text(Date.now, format: .dateTime.day().month().year())
            Text(Date.now.formatted(date: .long, time: .shortened))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
