//
//  AddingHapticEffects.swift
//  CupcakeCorner
//
//  Created by ☕️ Gabo.montero on 3/16/24.
//

import CoreHaptics
import SwiftUI

// .. for more advanced haptics, apple provides a framework:
// .. "Core Haptics"
// .. - lets us create customizable haptics by combining taps, continuous vibrations, parameter curves, and more

struct AddingHapticEffects: View {
    @State private var counter = 0
    // .. we need to create an instance as a property
    @State private var engine: CHHapticEngine? // .. this' the actual object responsible for creating vibrations
    
    var body: some View {
        Button("Tap Count: \(counter)") {
            counter += 1
        }
        // .. triggers whenever the buttons is pressed
        //.sensoryFeedback(.increase, trigger: counter) // .. haptic effect
        // .. or a midding collision between two soft objects
        .sensoryFeedback(.impact(flexibility: .soft, intensity: 0.5), trigger: counter)
        // .. or an intense between two heavy objects
        //.sensoryFeedback(.impact(weight: .heavy, intensity: 1), trigger: counter)
        
        Button("Tap Me", action: complexSuccess)
            // .. makes sure the haptics system is started
            .onAppear(perform: prepareHaptics) // .. so the tap gesture works correctly
    }
    
    // .. we're going to create that as soon as our main view appears
    func prepareHaptics() {
        // .. if current devive supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }
        
        do {
            // .. we'll start the engine
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            // .. and print an error if it fails
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    // .. we can configure parameters that control:
    // ..
    // .. how strong the haptic should be (.hapticIntensity) and
    // .. how "sharp" it is (.hapticSharpness)
    func complexSuccess() {
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }
        
        var events = [CHHapticEvent]()
        
        // create one instance, sharp tap
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        
        events.append(event)
        
        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription)")
        }
    }
}

#Preview {
    AddingHapticEffects()
}
