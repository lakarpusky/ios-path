//
//  RespondingToStateChanges.swift
//  Instafilter
//
//  Created by ☕️ Gabo.montero on 3/26/24.
//

import SwiftUI

struct RespondingToStateChanges: View {
    @State private var blurAmount: CGFloat = 0.0 {
        // .. doesn't work when working with bindings
        didSet {
            print("New value is \(blurAmount)")
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
                // .. to run a function when a particular value changes
                .onChange(of: blurAmount) { oldValue, newValue in
                    print("line.24: New value is \(newValue)")
                }
        }
    }
}

#Preview {
    RespondingToStateChanges()
}
