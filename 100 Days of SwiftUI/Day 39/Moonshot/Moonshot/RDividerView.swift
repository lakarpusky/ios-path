//
//  RDividerView.swift
//  Moonshot
//
//  Created by ☕️ Gabo.montero on 10/24/23.
//

import SwiftUI

struct RDividerView: View {
    let width: CGFloat?
    let height: CGFloat?
    
    init(width: CGFloat? = nil, height: CGFloat? = nil) {
        self.width = width
        self.height = height
    }
    
    var body: some View {
        Rectangle()
            .frame(width: width, height: height)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}
