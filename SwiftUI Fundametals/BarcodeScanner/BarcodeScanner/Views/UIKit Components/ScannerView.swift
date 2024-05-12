//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by ☕️ Gabo.montero on 5/12/24.
//

import SwiftUI

/**
 * a normal `View`, has a `body`
 * if we conforms to`UIViewControllerRepresentable`, is still a view, but the body we return is a view controller `UIViewController`
 */
struct ScannerView: UIViewControllerRepresentable {
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    // 1. define the coordinator to communicate with SwiftUI
    final class Coordinator: NSObject, ScannerVCDelegate {
        private let scannerView: ScannerView
        
        // 2. making the connection with the view
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            print(barcode)
            // .. so the coordinator talk to the SwitUI view, here's the value you need
            scannerView.scannedCode = barcode
        }
        
        func didSurfaceError(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannerView.alertItem = AlertContext.invalidScannedType
            }
        }
    }
}

#Preview {
    ScannerView(
        scannedCode: .constant("1234"),
        alertItem: .constant(AlertContext.invalidDeviceInput)
    )
}
