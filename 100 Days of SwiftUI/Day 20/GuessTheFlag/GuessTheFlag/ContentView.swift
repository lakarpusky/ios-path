//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by ☕️ Gabo.montero on 9/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    
    var body: some View {
//        ZStack {
//            VStack(spacing: 0) {
//                Color(red: 1, green: 0.8, blue: 0)
//                Color.orange
//            }
            
//            LinearGradient(
//                gradient: Gradient(colors: [.white, .black]),
//                startPoint: .top,
//                endPoint: .bottom
//            )
            
//            LinearGradient(
//                gradient: Gradient(stops: [
//                    .init(color: .white, location: 0.45),
//                    .init(color: .black, location: 0.55)
//                ]),
//                startPoint: .top,
//                endPoint: .bottom
//            )
            
//            RadialGradient(
//                gradient: Gradient(colors: [.blue, .black]),
//                center: .center,
//                startRadius: 20,
//                endRadius: 200
//            )
            
//            AngularGradient(
//                gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]),
//                center: .center
//            )
//        }
//        .ignoresSafeArea()
        
//        VStack {
//            Button(
//                "Delete selection",
//                action: executeDelete
//            )
//            .buttonStyle(.borderedProminent)
//            .tint(.mint)
//
//            Button {
//                print("Button was tapped")
//            } label: {
//                Text("Tap me!")
//                    .padding()
//                    .foregroundColor(.white)
//                    .background(.red)
//            }
//
//            Button {
//                print("Edit button was tapped")
//            } label: {
//                Image(systemName: "pencil").renderingMode(.original)
//                Label("Edit", systemImage: "pencil")
//            }
//        }
        
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) {}
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Please read this.")
        }
    }
    
    func executeDelete() {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
