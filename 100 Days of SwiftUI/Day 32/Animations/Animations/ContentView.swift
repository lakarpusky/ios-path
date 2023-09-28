//
//  ContentView.swift
//  Animations
//
//  Created by ☕️ Gabo.montero on 9/28/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        print(animationAmount)
        
        return VStack {
            Spacer()
            
            Button("Tap Me") {
                //animationAmount += 0.2
            }
            .padding(50)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Circle())
            //.scaleEffect(animationAmount)
            //.blur(radius: (animationAmount - 1) * 3)
            
            // .. overlays
            //.overlay(
                //Circle()
                    //.stroke(.red)
                    //.scaleEffect(animationAmount)
                    //.opacity(2 -  animationAmount)
                    //.animation(
                        //.easeOut(duration: 1)
                            //.repeatForever(autoreverses: false),
                        //value: animationAmount
                    //)
            //)
            //.onAppear {
                //animationAmount = 2
            //}
            
            // .. Implicit animation
            //.animation(.easeOut, value: animationAmount)
            
            // .. Customizing animations
            //.animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
            //.animation(
                //.easeInOut(duration: 2)
                    //.delay(1)
                    //.repeatCount(3, autoreverses: true),
                //value: animationAmount
            //)
            
            Spacer()

            // .. bound to animation, will automatically animati its changes
            Stepper(
                "Scale amount",
                value: $animationAmount.animation(
                    .easeInOut(duration: 1)
                        .repeatCount(3, autoreverses: true)
                ),
                in: 1...10
            )
            
            Spacer()
            
            Button("Tap Me 2") {
                //animationAmount += 1
            }
            .padding(40)
            .background(.orange)
            .foregroundStyle(.white)
            .clipShape(Circle())
            //.scaleEffect(animationAmount)
            
            Spacer()
            
            Button("Tap Me 3") {
                // .. Explicit animation
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                    animationAmount += 260
                }
            }
            .padding(50)
            .background(.green)
            .foregroundStyle(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .rotation3DEffect(
                .degrees(animationAmount),
                axis: (x: 0, y: 1, z: 0)
            )
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
