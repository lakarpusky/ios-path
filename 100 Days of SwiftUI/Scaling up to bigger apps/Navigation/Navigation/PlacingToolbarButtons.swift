//
//  PlacingToolbarButtons.swift
//  Navigation
//
//  Created by ☕️ Gabo.montero on 3/12/24.
//

import SwiftUI

struct PlacingToolbarButtons: View {
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Tap Me") {
                            //
                        }
                    }
                    
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Or Tap Me") {
                            //
                        }
                    }
                    
                    // .. or
                    
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Tap Me") {
                            //
                        }
                        Button("Or Tap Me") {
                            //
                        }
                    }
                }
        }
    }
}

#Preview {
    PlacingToolbarButtons()
}
