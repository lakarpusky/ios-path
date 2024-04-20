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
                    .font(.title)
                
                Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            .navigationTitle("Your code")
        }
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
