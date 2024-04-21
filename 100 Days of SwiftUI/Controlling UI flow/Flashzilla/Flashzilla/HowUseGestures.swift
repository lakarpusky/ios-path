//
//  HowUseGestures.swift
//  Flashzilla
//
//  Created by ☕️ Gabo.montero on 4/20/24.
//

import SwiftUI

struct OnTapGesture: View {
    var body: some View {
        Text("On Tap")
            // .. to make them handle double taps, triple taps, and more
            .onTapGesture(count: 2) {
                print("Double tapped!")
            }
            .padding()
            .foregroundStyle(.blue)
    }
}

struct OnLongPressMinimalDuration: View {
    var body: some View {
        Text("On Long Press")
            // .. can specify a minimum duration for the press
            // .. as soon as you press down the change closure will be called with is parameter set to true
            .onLongPressGesture(minimumDuration: 1) {
                print("Long pressed!")
            // .. if you release before the gesture has been recognized, or
            // .. if you hold down for the full length of the recognizer (the gesture is no longer in flight)
            // .. the change closure will be called with is parameter set to false
            } onPressingChanged: { inProgress in
                print("In progress: \(inProgress)!")
            }
            .padding()
            .foregroundStyle(.orange)
    }
}

struct OnPinchinInOutGesture: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    
    var body: some View {
        Text("Pinchin In / Out")
            // .. scales the view up and down
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                // .. pinching in and out gesture
                MagnifyGesture()
                    .onChanged { value in
                        currentAmount = value.magnification - 1
                    }
                    .onEnded { value in
                        finalAmount += currentAmount
                        currentAmount = 0
                    }
            )
            .padding()
            .foregroundStyle(.green)
    }
}

struct OnRotateGesture: View {
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    var body: some View {
        Text("Rotation")
            .rotationEffect(currentAmount + finalAmount)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        currentAmount = value.rotation
                    }
                    .onEnded { value in
                        finalAmount += currentAmount
                        currentAmount = .zero
                    }
            )
            .foregroundStyle(.brown)
    }
}

struct OnGestureClashes: View {
    var body: some View {
        // .. when you have two or more gestures that might be recognized at the same time
        // .. such as if you have:
        VStack {
            // .. one gesture attached to a view
            Text("Gestures Clash")
                .onTapGesture { // 1. will always give the child's gesture priority
                    print("child view tapped")
                }
                .foregroundStyle(.mint)
        }
        .padding()
        // 2. if you want to change that you can use the:
        .highPriorityGesture(
            TapGesture()
                .onEnded {
                    print("parent view tapped")
                }
        )
        // 3. or... to tell you want both the parent and child gestures to trigger at the same time
        .simultaneousGesture(
            TapGesture()
                .onEnded {
                    print("parent view tapped too")
                }
        )
    }
}

struct OnGestureSequences: View {
    // how far the circle has been dragged
    @State private var offset = CGSize.zero
    
    // whether it is currently being dragged or not
    @State private var isDragging = false
    
    var body: some View {
        // a drag gesture that updates offset and isDragging as it moves around
        let dragGesture = DragGesture()
            .onChanged { value in offset = value.translation }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        // a long press gesture that enables isDragging
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        
        // a combined gesture that forces the user to long press then dragg
        let combined = pressGesture.sequenced(before: dragGesture)
        
        // a (64x64) circle that scales up when it's dragged,
        // sets its offsets to whatever we had back from the drag gresture,
        // and uses our combined gesture.
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    }
}

struct HowUseGestures: View {
    var body: some View {
        OnTapGesture()
        OnLongPressMinimalDuration()
        OnPinchinInOutGesture()
        OnRotateGesture()
        OnGestureClashes()
        OnGestureSequences()
    }
}

#Preview {
    HowUseGestures()
}
