//
//  DrawingGroupView.swift
//  Drawing
//
//  Created by ☕️ Gabo.montero on 10/27/23.
//

import SwiftUI

struct ColorCyclingCircle: View {
    
    var amount = 0.0
    var steps = 100
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(
            hue: targetHue,
            saturation: 1,
            brightness: brightness
        )
    }
    
    var body: some View {
        ZStack {
            ForEach(0..<steps, id: \.self) { value in
                Circle()
                    .inset(by: Double(value))
                    //.strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
                    //.. increasing the complexity
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2
                    )
            }
        }
        //.. render contents of the view into an off-screen image before putting it back onto the screen
        //.. behind the scenes this is powered by Metal
        //.. working directly with the GPU for extremely fast graphics
        .drawingGroup()
        //.. you should wait until you have an actual performance problem
    }
}

struct DrawingGroupView: View {
    
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: colorCycle)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
        }
        .padding()
    }
}

#Preview {
    DrawingGroupView()
}
