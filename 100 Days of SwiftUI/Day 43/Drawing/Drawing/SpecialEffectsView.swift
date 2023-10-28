//
//  SpecialEffectsView.swift
//  Drawing
//
//  Created by ☕️ Gabo.montero on 10/28/23.
//

import SwiftUI

struct SpecialEffectsView: View {
    
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.orange)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(.green)
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            HStack {
                Image("arc_card")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .colorMultiply(.green)
                
                //.. blur and saturation in the same view
                Image("arc_card")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .saturation(amount)
                    .blur(radius: (1 - amount) * 20)
            }
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

#Preview {
    SpecialEffectsView()
}
