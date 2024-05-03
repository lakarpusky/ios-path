//
//  SkiDetailsView.swift
//  SnowSeeker
//
//  Created by ☕️ Gabo.montero on 5/2/24.
//

import SwiftUI

struct SkiDetailsView: View {
    let resort: Resort
    
    var body: some View {
        Group {
            VStack {
                Text("Elevation")
                    .font(.caption.bold())
                
                Text("\(resort.elevation)m")
                    .font(.title3)
            }
            
            VStack {
                Text("Snow")
                    .font(.caption.bold())
                
                Text("\(resort.snowDepth)cm")
                    .font(.title3)
            }
        }
        // .. doesn't actually affect the group itself, because it has no impact on layout
        // .. it does get passed down to its child views,
        .frame(maxWidth: .infinity) // .. they will automatically spread out horizontally
    }
}

#Preview {
    SkiDetailsView(resort: .example)
}
