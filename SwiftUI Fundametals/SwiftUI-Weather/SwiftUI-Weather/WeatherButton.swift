//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by ☕️ Gabo.montero on 5/10/24.
//

import SwiftUI

struct WeatherButton: View {
    let title: String
    let textColor: Color
    let backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    WeatherButton(
        title: "Button",
        textColor: .white,
        backgroundColor: .blue
    )
}
