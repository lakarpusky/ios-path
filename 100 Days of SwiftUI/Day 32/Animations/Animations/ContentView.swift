//
//  ContentView.swift
//  Animations
//
//  Created by ☕️ Gabo.montero on 9/28/23.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView: View {
    
    let letters = Array("Hello SwiftUI")
    
    @State private var animationAmount = 0.0
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var isShowingRed = false
    
    var body: some View {
        //print(animationAmount)
        
        // .. Building custom transitions using "ViewBuilder"
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
        
        // .. Showing and hiding views with transitions
//        VStack {
//            Button("Tap Me") {
//                withAnimation {
//                    isShowingRed.toggle()
//                }
//            }
//            
//            if isShowingRed {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 200, height: 200)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
//            }
//        }
        
        // .. Animating gestures
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count, id: \.self) { num in
//                Text(String(letters[num]))
//                    .padding(5)
//                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                    .background(enabled ? .blue : .red)
//                    .offset(dragAmount)
//                    .animation(.default.delay(Double(num) / 20), value: dragAmount)
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged { dragAmount = $0.translation }
//                .onEnded { _ in
//                    dragAmount = .zero
//                    enabled.toggle()
//                }
//        )
        
          // .. Animating gestures
//        LinearGradient(
//            gradient: Gradient(colors: [.yellow, .red]),
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing
//        )
//        .frame(width: 300, height: 300)
//        .clipShape(RoundedRectangle(cornerRadius: 10))
//        .offset(dragAmount)
//        .gesture(
//            DragGesture()
//                .onChanged { dragAmount = $0.translation }
//                .onEnded { _ in
//                    withAnimation(.spring()) {
//                        dragAmount = .zero
//                    }
//                }
//        )
//        .animation(.spring(), value: dragAmount)
        
          // .. Controlling the animation stack
//        VStack {
//            Spacer()
//            
//            Button("Tap Me") {
//                //animationAmount += 0.2
//            }
//            .padding(50)
//            .background(.blue)
//            .foregroundStyle(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmount)
//            .blur(radius: (animationAmount - 1) * 3)
//            
//             //.. overlays
//            .overlay(
//                Circle()
//                    .stroke(.red)
//                    .scaleEffect(animationAmount)
//                    .opacity(2 -  animationAmount)
//                    .animation(
//                        .easeOut(duration: 1)
//                            .repeatForever(autoreverses: false),
//                        value: animationAmount
//                    )
//            )
//            .onAppear {
//                animationAmount = 2
//            }
//            
//             //.. Implicit animation
//            .animation(.easeOut, value: animationAmount)
//            
//             //.. Customizing animations
//            .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
//            .animation(
//                .easeInOut(duration: 2)
//                    .delay(1)
//                    .repeatCount(3, autoreverses: true),
//                value: animationAmount
//            )
//            
//            Spacer()
//
//            // .. bound to animation, will automatically animati its changes
//            Stepper(
//                "Scale amount",
//                value: $animationAmount.animation(
//                    .easeInOut(duration: 1)
//                        .repeatCount(3, autoreverses: true)
//                ),
//                in: 1...10
//            )
//            
//            Spacer()
//            
//            HStack {
//                Button("Tap Me 2") {
//                    animationAmount += 1
//                }
//                .padding(40)
//                .background(.orange)
//                .foregroundStyle(.white)
//                .clipShape(Circle())
//                .scaleEffect(animationAmount)
//                
//                Spacer()
//                
//                Button("Tap Me 3") {
//                    // .. Explicit animation
//                    withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
//                        animationAmount += 260
//                    }
//                }
//                .padding(50)
//                .background(.green)
//                .foregroundStyle(.white)
//                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//                .rotation3DEffect(
//                    .degrees(animationAmount),
//                    axis: (x: 0, y: 1, z: 0)
//                )
//            }
//            
//            Spacer()
//            
//            Button("Tap Me") {
//                enabled.toggle()
//            }
//            .frame(width: 200, height: 200)
//            .background(enabled ? .blue : .red)
//            .animation(.default, value: enabled)
//            .foregroundStyle(.white)
//            .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//            .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
//            
//            Spacer()
//        }
//        .padding()
    }
}

#Preview {
    ContentView()
}
