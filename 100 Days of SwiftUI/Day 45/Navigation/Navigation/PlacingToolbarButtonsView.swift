//
//  PlacingToolbarButtonsView.swift
//  Navigation
//
//  Created by ☕️ Gabo.montero on 11/14/23.
//

import SwiftUI

struct PlacingToolbarButtonsView: View {
    var body: some View {
        NavigationStack{
            Text("Hello, world!")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Tap Me") {
                            // ..
                        }
                    }
                    
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Tap Me 2") {
                            // ..
                        }
                    }
                    
                    // .. or
                    
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Tap Me 3") {
                            // ..
                        }
                        Button("Tap Me 4") {
                            // ..
                        }
                    }
                }
        }
    }
}

#Preview {
    PlacingToolbarButtonsView()
}
