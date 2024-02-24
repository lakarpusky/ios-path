//
//  ButtonsImages.swift
//  GuessTheFlag
//
//  Created by ☕️ Gabo.montero on 2/24/24.
//

import SwiftUI

struct ButtonsImages: View {
    var body: some View {
        // .. simplest way to make a button
        // .. - we can attach a "role", which iOS can use to adjust its appearance both visually and for screen readers
        Button("Delete selection", role: .destructive) {
            print("Now deleting...")
        }
        
        // .. we can use one of the built-in styles
        VStack {
            Button("Button 1") {}
                .buttonStyle(.bordered)
            
            Button("Button 2", role: .destructive) {}
                .buttonStyle(.bordered)
            
            Button("Button 3") {}
                .buttonStyle(.borderedProminent)
                .tint(.mint) // .. customize the colors used for a bordered button
            
            Button("Button 4", role: .destructive) {}
                .buttonStyle(.borderedProminent)
        }
        
        // .. something completely custom, you can pass a custom label using a second trailing closure:
        Button {
            print("Button was tapped")
        } label: {
            Text("Tap me!")
                .padding()
                .foregroundStyle(.white)
                .background(.red)
        }
        
        // .. both text and image at the same time
        Button("Edit", systemImage: "pencil") {
            print("Edit button was tapped")
        }
        
        Button {
            print("Edit button was tapped")
        } label: {
            Label("Edit", systemImage: "pencil")
                .padding()
                .foregroundStyle(.white)
                .background(.blue)
        }
    }
}

#Preview {
    ButtonsImages()
}
