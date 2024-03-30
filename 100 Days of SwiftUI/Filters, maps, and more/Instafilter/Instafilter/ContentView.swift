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
import StoreKit

struct ContentView: View {
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview
    
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var showingFilters = false
    @State private var beginImage: CIImage?
    
    // .. to track whatever picture the user selected
    @State private var selectedItem: PhotosPickerItem? // .2. step
    
    // .. we'll make it flexible later so it can be changed
    @State private var ciFilter: CIFilter = CIFilter.sepiaTone() // .. as our default filter
    
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
                        .foregroundStyle(processedImage == nil ? .secondary : .primary)
                    
                    Slider(value: $filterIntensity)
                        // .. to watch for value changes
                        .onChange(of: filterIntensity, applyProcessing)
                        .disabled(processedImage == nil)
                        
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change Filter", action: changeFilter)
                        .disabled(processedImage == nil)
                    
                    Spacer()
                    
                    if let processedImage {
                        ShareLink(
                            item: processedImage,
                            preview: SharePreview("Instafilter image", image: processedImage)
                        )
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafiller")
            .confirmationDialog("Select a filter", isPresented: $showingFilters) {
                Button("Crystalize") { setFilter(CIFilter.crystallize()) }
                Button("Edges") { setFilter(CIFilter.edges()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Vignette") { setFilter(CIFilter.vignette()) }
                Button("Cancel", role: .cancel) { }
            }
        }
    }
    
    func changeFilter() {
        showingFilters = true
    }
    
    @MainActor func setFilter(_ filter: CIFilter) {
        ciFilter = filter
        loadImage()
        
        filterCount += 1
        
        if filterCount >= 5 {
            requestReview()
        }
    }
    
    func loadImage() {
        Task {
            // .. we can't load a simple (SwiftUI Image) because they can't be fed into Core Image,
            // .. so instead we load a pure (Data) object...
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { 
                return
            }
            
            // ...and convert that to a (UIImage)
            guard let inputImage = UIImage(data: imageData) else { 
                return
            }
            
            // .. it's more safer to use the filter's (setValue) over dedicated (inputImage) property
            beginImage = CIImage(image: inputImage)!
            ciFilter.setValue(beginImage, forKey: kCIInputImageKey)
            
            applyProcessing()
        }
    }
    
    func applyProcessing() {
        // .. it will set our filter key based on the value
        let inputKeys = ciFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) { 
            ciFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        
        if inputKeys.contains(kCIInputRadiusKey) { 
            ciFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)
        }
        
        if inputKeys.contains(kCIInputScaleKey) { 
            ciFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
        }
        
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
