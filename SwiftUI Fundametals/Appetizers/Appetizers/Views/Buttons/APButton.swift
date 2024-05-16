//
//  APButton.swift
//  Appetizers
//
//  Created by ☕️ Gabo.montero on 5/13/24.
//

import SwiftUI

struct APButton: View {
    // .. to support custom formats
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(.brandPrimary)
            .cornerRadius(10)
    }
}

#Preview {
    APButton(title: "Text Title")
}
