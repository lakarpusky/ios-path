//
//  MeView.swift
//  HotProspects
//
//  Created by ☕️ Gabo.montero on 4/18/24.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct MeView: View {
    @AppStorage("name") private var name = "Anonymous"
    @AppStorage("emailAddress") private var emailAddress = "lakarpusky@gmail.com"
    
    // .. we could save a little work by caching the generated QR code,
    // .. we wouldn't have to pass in the name and email address each time.
    @State private var qrCode = UIImage()
    
    let context = CIContext() // active (Core Image) context
    let filter = CIFilter.qrCodeGenerator() // instance of (Core Image) QR code generator filter
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    // it tells what kind of information we're wasking the user for
                    .textContentType(.name)
                    .font(.title)
                
                TextField("Email address", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .font(.title)
                
                Image(uiImage: qrCode)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .contextMenu {
                        /**
                         * 1. Open your target settings, and select the `Info` tab
                         * 2. Right click choose `Add Row`
                         * 3. Select `Privacy - Photo Library Additions Usage Description` for the key name
                         * 4. Enter `We want to save your QR code.` as the value
                         */
                        ShareLink(
                            // .. we need to convert the (UIImage) of our QR code to a (SwiftUI Image)
                            item: Image(uiImage: qrCode),
                            preview: SharePreview("My QR Code", image: Image(uiImage: qrCode))
                        )
                    }
            }
            .navigationTitle("Your code")
            // .. to make sure is updated when the view is first shown,
            // .. and also when either the (name) or (email address) changes.
            .onAppear(perform: updateCode)
            .onChange(of: name, updateCode)
            .onChange(of: emailAddress, updateCode)
        }
    }
    
    func updateCode() {
        qrCode = generateQRCode(from: "\(name)\n\(emailAddress)")
    }
    
    func generateQRCode(from string: String) -> UIImage {
        // .. our input for the filter will be a string, but the input for the filter is (Data)
        filter.message = Data(string.utf8) // .. so we need to convert that
        
        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }
        
        // .. if conversion fails we'll send back the image from (SF Symbols)
        return UIImage(systemName: "xmark.circle") ?? UIImage() // .. then we'll send back an empty (UIImage)
    }
}

#Preview {
    MeView()
        .modelContainer(for: Prospect.self, inMemory: true)
}
