//
//  LoadingPhotosUserPhotoLibrary.swift
//  Instafilter
//
//  Created by ☕️ Gabo.montero on 3/27/24.
//

import SwiftUI
import PhotosUI // .1. step

struct LoadingPhotosUserPhotoLibrary: View {
    // .2. step
    // .. it's just a reference to a picture in the user's library
    @State private var pickerItem: PhotosPickerItem? // .. to store the item was selected
    @State private var selectedImage: Image?  // .. to store that selected item as Swift Image
    
    @State private var pickerItems = [PhotosPickerItem]()
    // .. we can't watch a single photo picker item item any more
    @State private var selectedImages = [Image]() // .. instead, we create an array to store the images that get loaded
    
    var body: some View {
        VStack {
            // .3. step
            // .. provide us with a simple way to import one or more photos from the user's photo library
            PhotosPicker(
                "Select a picture",
                selection: $pickerItem, // .. where to store the selected image
                matching: .images // .. what type of data to show
            )
            .font(.title2.bold())
            .foregroundStyle(.orange)
            
            // .. let the user select several images
            PhotosPicker(
                //"Select images",
                selection: $pickerItems,
                maxSelectionCount: 3, // .. limit how many pictures actually can be selected at once
                // .. limit the kinds of pictures that can be imported
                // .. all images except screenshots
                matching: .any(of: [.images, .not(.screenshots)])//matching: .images
            ) {
                Label("Select images", systemImage: "photo")
            }
            .font(.title2.bold())
            
            // .5. step
            selectedImage?
                .resizable()
                .scaledToFit()
            
            ScrollView {
                ForEach(0..<selectedImages.count, id: \.self) { i in
                    selectedImages[i]
                        .resizable()
                        .scaledToFit()
                }
            }
        }
        
        // .4. step
        // .. to watch "pickerItem" for changes,
        // .. when it changes it means the user has selected a picture for us to load
        //.onChange(of: pickerItem) {
        //    Task {
        //        // .. tells SwiftUI to load actual underlying data from the picker item into a SwiftUI Image
        //        selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
        //    }
        //}
        
        // .. clear the array when new items are selected,
        // .. then load the new set individually
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()
                
                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
    }
}

#Preview {
    LoadingPhotosUserPhotoLibrary()
}
