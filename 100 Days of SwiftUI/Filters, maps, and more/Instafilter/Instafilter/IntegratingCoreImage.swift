//
//  IntegratingCoreImage.swift
//  Instafilter
//
//  Created by ☕️ Gabo.montero on 3/26/24.
//

import SwiftUI
import CoreImage
 // .. filters are the things taht do the actual work of transforming image data somehow
import CoreImage.CIFilterBuiltins

/**
 * UIImage:
 * - standard image type for UIKit
 * - capable of working a variety of image types, including PNG, SVG, sequences that form an animation
 * - closests to SwiftUI's "Image" type
 *
 * CGImage:
 * - comes from Core Graphics
 * - simpler image type
 * - just two-dimensional array of pixels
 *
 * CIImage:
 * - comes from Core Image
 * - stores all the information required to produce an image, but doesn't actually turn that into pixels unless it's asked to
 * - Apple calls it "an image recipe" rather than an actual image
 *
 *
 * We can create a:
 * - UIImage from a CGImage
 * - CGImage from a UIImage
 * - CIImage from a UIImage and from a CGImage
 * - CGImage from a CIImage
 * - SwiftUI Image from both a UIImage and a CGImage
 */

struct IntegratingCoreImage: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        // .. if the optional image is "nil" the in won't trigger the function
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        // .1. to load the example image into a (UIImage)
        let inputImage = UIImage(resource: .example) // .. to load images from our asset catalog
        
        // .2. convert that into a (CIImage), what Core Image wants to work with
        let beginImage = CIImage(image: inputImage)
        
        // .3. we'll create the context and filter
        let context = CIContext()
        let currentFilter = CIFilter.twirlDistortion()//crystallize()//pixellate()
        
        // .4. customizing our filter
        currentFilter.inputImage = beginImage // .. the image we want to change
        //currentFilter.intensity = 1 // how strongly the sepia effect should be applied (0...1)
        //currentFilter.scale = 100
        //currentFilter.radius = 1000
        //currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)
        
        let amount = 1.0
        let inputKeys = currentFilter.inputKeys
        
        // .. we can literally ask the current filter what values it supports, then send them on in
        // .. we can now change the "twirl distorsion" to any other filter,
        // .. and the code will carry on working
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }
        
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
        }
        
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
        }
        
        // get a (CIImage) from our filter or exit if that fails
        guard let outputImage = currentFilter.outputImage else {
            return
        }
        
        // attempt to get a (CGImage) from our (CIImage)
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { 
            return
        }
        
        // convert that to a (UIImage)
        let uiImage = UIImage(cgImage: cgImage)
        
        // and convert that to a SwiftUI Image
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    IntegratingCoreImage()
}
