//
//  ResizingImagesAvailableSpace.swift
//  Moonshot
//
//  Created by ☕️ Gabo.montero on 3/8/24.
//

import SwiftUI

struct ResizingImagesAvailableSpace: View {
    var body: some View {
        Image(.courtois)
            .resizable()
            .scaledToFit()
            // .. to give a frame relative to the horizontal size of its parent
            .containerRelativeFrame(.horizontal) { size, axis in
                // .. "size" will be the size of our container
                size * 0.6 // .. 60% of container width
            }
    }
}

#Preview {
    ResizingImagesAvailableSpace()
}
