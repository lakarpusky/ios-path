//
//  ControllingImageInterpolation.swift
//  HotProspects
//
//  Created by ☕️ Gabo.montero on 4/16/24.
//

import SwiftUI

/**
 * By default, we get image interpolation
 * ---------
 * There's a performance cost, but most of the time it's not worth worrying about
 * ---------
 * However, there is one place where image interpolation causes a problem,
 * and that's when you're dealing with precise pixels.
 */

struct ControllingImageInterpolation: View {
    var body: some View {
        /**
         * Take a look at the edges of the colors: They look jagged, but also blurry
         * ------------
         * The jagged part comes from the original image, but the blurry part is where SwiftUI is trying
         * to blend the pixels as they are stretched to make the stretching less obvious.
         * ------------
         * For situations like this one, SwiftUI gives us the  ( interpolation ) modifier that lets us control
         * how pixel blending is applied.
         */
        Image(.example)
            // this turns off image interpolation entirely,ÏÏ
            .interpolation(.none) // ...so rather than blending pixels they just get scaled up woth sharp edges
            .resizable()
            .scaledToFit()
            .background(.black)
        
        // .. now we'll see the alien retains its pixellated look
    }
}

#Preview {
    ControllingImageInterpolation()
}
