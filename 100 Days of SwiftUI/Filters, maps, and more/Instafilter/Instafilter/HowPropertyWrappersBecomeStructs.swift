//
//  HowPropertyWrappersBecomeStructs.swift
//  Instafilter
//
//  Created by ☕️ Gabo.montero on 3/26/24.
//

import SwiftUI

struct HowPropertyWrappersBecomeStructs: View {
    @State private var blurAmount = 0.0 {
        didSet {
            print("New value is \(blurAmount)")
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .blur(radius: blurAmount)
            
            // .. but using a binding doesn't bc it bypasses the setter and adjust the value directly
            Slider(value: $blurAmount, in: 0...20)
            
            Button("Random Blur") {
                // .. chaning the property directly using a button works fine,
                // .. bc it goes through the nonmutating setter and triggers the "didSet" observer
                blurAmount = Double.random(in: 0...20)
            }
        }
    }
}

#Preview {
    HowPropertyWrappersBecomeStructs()
}
