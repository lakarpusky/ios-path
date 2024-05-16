//
//  XDismiss.swift
//  Appetizers
//
//  Created by ☕️ Gabo.montero on 5/13/24.
//

import SwiftUI

struct XDismiss: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    XDismiss()
}
