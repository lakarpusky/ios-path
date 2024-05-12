//
//  AFButton.swift
//  Apple-Frameworks
//
//  Created by ☕️ Gabo.montero on 5/11/24.
//

import SwiftUI

struct AFButton: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title2.weight(.semibold))
            .frame(width: 280, height: 50)
            .background(.red.gradient)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    AFButton(title: "Test Title")
}
