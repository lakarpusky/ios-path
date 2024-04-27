//
//  HowLayoutWorks.swift
//  LayoutAndGeometry
//
//  Created by ☕️ Gabo.montero on 4/27/24.
//

import SwiftUI

struct HowLayoutWorks: View {
    var body: some View {
        // .. SwiftUI effectively works its way from bottom to top
        // .. when it comes to a view and its modifiers
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/) // .. the (Text) view becomes a child of its inmediate modifier
            .background(.red) // .. layout neutral: ask their children how much space do they need in screen
        
        Text("Hello, World!") // .. communicate down I need X by Y
            // .. you can have the whole screen minus 20 points on each side,
            .padding(20) // .. how much of it do you need (Text)
            .background(.yellow)
        
        Text("World, Hello!")
            .background(.orange)
            .padding()
        
        // .. if your view hierarchy is wholly layout neutral,
        // .. then it will automatically take up all available sapce.
        // .. shapes and colors are layout neutral:
        Color.gray
        
        // .. applying modifiers creates new views rather than just modifying existing views in-place
    }
}

#Preview {
    HowLayoutWorks()
}
