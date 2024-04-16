//
//  CreatingContextMenus.swift
//  HotProspects
//
//  Created by ☕️ Gabo.montero on 4/16/24.
//

import SwiftUI

struct CreatingContextMenus: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .background(backgroundColor)
                .foregroundStyle(.white)
            
            Text("Change color")
                .padding()
                .contextMenu {
                    /**
                     * Just like ( TabView ), each time in a context menu can have text and 
                     * an image attached to it using a  ( Label ) view.
                     * -----------------
                     * iOS renders each image as a solid color where the opacity is preseerved.
                     *
                     * This makes many pictures useless: if you had different photos, all would be rendered
                     * as a plain black square because all the color got remvoved.
                     *
                     * Instead, you should aim for line art icons sush as Apple's SF Symbols:
                     */
                    
                    // .. if you really want that item to appear red,
                    // .. you should use a button role instead:
                    Button("Red", systemImage: "checkmark.circle.fill", role: .destructive) {
                        backgroundColor = .red
                    }
                    .foregroundStyle(.red) // .. the modifier is ignored by default
                    
                    Button("Green", systemImage: "checkmark.circle.fill") {
                        backgroundColor = .green
                    }
                    
                    Button("Blue") {
                        backgroundColor = .blue
                    }
                    
                    /**
                     * Tips:
                     * ----
                     * 1. If you're going to use them, use them in lots of places -- it can be frustrating 
                     *   to press and hold on something only to find nothing happeds.
                     * 2. Keep you list of options as short as you can -- aim for three or less.
                     * 3. Don't repeat options the user can already see elsewhere in your UI
                     *
                     * Remember, context menus are by their nature hidden, so please think twice before
                     * hiding important actions in a context menu
                     */
                }
        }
    }
}

#Preview {
    CreatingContextMenus()
}
