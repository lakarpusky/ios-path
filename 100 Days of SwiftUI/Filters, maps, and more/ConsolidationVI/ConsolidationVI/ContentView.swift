//
//  ContentView.swift
//  ConsolidationVI
//
//  Created by ☕️ Gabo.montero on 4/12/24.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var seledtedImages: [ImageItem] = []
    
    @State private var showUserLocation = false
    @State private var showNameAlert = false
    @State private var photoName = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    ForEach(seledtedImages) { item in
                        NavigationLink(value: item) {
                            ZStack(alignment: .bottomLeading) {
                                item.image?
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 100)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 12)
                                    )
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color.black.opacity(0.3))
                                    }
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(item.name)
                                        .font(.headline.weight(.medium))
                                        .foregroundStyle(.yellow)
                                    
                                    Text(item.longDate)
                                        .font(.caption2.weight(.bold))
                                        .foregroundStyle(.white)
                                }
                                .padding()
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                        Button(action: { showUserLocation = true }) {
                                            Image(systemName: "info.bubble.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 25, height: 25)
                                                .foregroundStyle(.white)
                                        }
                                    }
                                    Spacer()
                                }
                                .padding()
                            }
                            .padding(.horizontal, 12)
                        }
                    }
                }
                .navigationDestination(for: ImageItem.self) { item in
                    ImageDetailView(item: item)
                }
                
                if seledtedImages.isEmpty {
                    ContentUnavailableView(
                        "No Data",
                        systemImage: "photo",
                        description: Text("There are not photos selected yet.")
                    )
                    .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("My Photo Library")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // to let users import a photo from their photo library
                PhotosPicker(selection: $selectedPhoto, matching: .images) {
                    Image(systemName: "photo")
                }
            }
            .task(id: selectedPhoto) {
                showNameAlert = selectedPhoto != nil
            }
            .alert("Name Photo", isPresented: $showNameAlert) {
                TextField("Write something...", text: $photoName)
                
                Button("Cancel", role: .cancel) {
                    selectedPhoto = nil
                    photoName = ""
                }
                
                Button("Save") {
                    // load an image instance from the picker provider
                    Task {
                        if let loadedImage = try? await selectedPhoto?.loadTransferable(type: Image.self) {
                            let item = ImageItem(name: photoName, image: loadedImage)
                            seledtedImages.append(item) // save the loaded image
                            selectedPhoto = nil
                            photoName = ""
                        }
                    }
                }
            } message: {
                Text("Please enter a name for the photo.")
            }
            .sheet(isPresented: $showUserLocation) {
                LocationMapView()
            }
        }
    }
}

#Preview {
    ContentView()
}
