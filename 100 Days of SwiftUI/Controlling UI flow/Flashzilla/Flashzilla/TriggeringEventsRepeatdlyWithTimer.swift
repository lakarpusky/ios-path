//
//  TriggeringEventsRepeatdlyWithTimer.swift
//  Flashzilla
//
//  Created by ☕️ Gabo.montero on 4/21/24.
//

import SwiftUI

/**
 * Important timer concept:
 * ---
 * If you're okay with your timer having a little float, you can specify some `tolerance`
 * -
 * This allows iOS to perform important energy optimization, because it can fire the timer at any point between
 * its scheduled fire time and its scheduled fire time plus the tolerance you specify.
 * -
 * The system can perform `timer coalescing`:
 * - it can push back your timer just a little so that it fires at the same time as one or more other timers,
 * - it can keep the CPU idling more and save battery power
 */

struct TriggeringEventsRepeatdlyWithTimer: View {
    @State private var counter = 0 // .. to fire the timer only five times
    
    // .. to create a timer publisher
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            // .. we can monitor the send chage announcements
            .onReceive(timer) { time in
                if counter == 5 {
                    // .. stopping timer
                    timer
                        .upstream // .. we need to go to is upstream publisher to find the timer itself
                        .connect() // .. we can connect to the timer publisher,
                        .cancel() // .. and ask it to cancel itself.
                } else {
                    print("The time is now \(time)")
                }
                
                counter += 1
            }
    }
}

#Preview {
    TriggeringEventsRepeatdlyWithTimer()
}
