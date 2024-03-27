//
//  ContentView.swift
//  Instafilter
//
//  Created by ☕️ Gabo.montero on 3/26/24.
//

import SwiftUI
import PhotosUI // .1. step
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    
    // .. to track whatever picture the user selected
    @State private var selectedItem: PhotosPickerItem? // .2. step
    
    // .. we'll make it flexible later so it can be changed
    @State private var ciFilter = CIFilter.sepiaTone() // .. as our default filter
    
    // .. to render many images it's a good idea
    let ciContext = CIContext() // .. to create a context once and keep it alive
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // .3. step
                // .. to place the picker view whereever we want to trigger an image selection
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView(
                            "No Picture",
                            systemImage: "photo.badge.plus",
                            description: Text("Import a photo to get started")
                        )
                    }
                }
                // .. to watch for selection change
                .onChange(of: selectedItem, loadImage)
                
                Spacer()
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        // .. to watch for value changes
                        .onChange(of: filterIntensity, applyProcessing)
                        
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change Filter", action: changeFilter)
                    
                    Spacer()
                    
                    //
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafiller")
        }
    }
    
    func changeFilter() {
        
    }
    
    func loadImage() {
        Task {
            // .. we can't load a simple (SwiftUI Image) because they can't be fed into Core Image,
            // .. so instead we load a pure (Data) object...
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { 
                return
            }
            
            // ...and convert that to a (UIImage)
            guard let inputImage = UIImage(data: imageData) else { return }
            
            // .. it's more safer to use the filter's (setValue) over dedicated (inputImage) property
            let beginImage = CIImage(image: inputImage)
            ciFilter.setValue(beginImage, forKey: kCIInputImageKey)
            
            applyProcessing()
        }
    }
    
    func applyProcessing() {
        // .. it will set our sepia filter's intensity based on the value
        ciFilter.intensity = Float(filterIntensity)
        
        // .. read the output image back from the filter...
        guard let outputImage = ciFilter.outputImage else { return }
        guard let cgImage = ciContext.createCGImage(outputImage, from: outputImage.extent) else {
            return
        }
        
        // ...ask to render it, then place the result so it's visible on-screen
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
}

#Preview {
    ContentView()
}
