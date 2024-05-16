//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by ☕️ Gabo.montero on 5/15/24.
//

import SwiftUI

// .. custom modifier to make action buttons look alike
struct StandarButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
