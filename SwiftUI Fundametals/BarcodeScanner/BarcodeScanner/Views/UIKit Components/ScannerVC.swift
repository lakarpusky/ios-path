//
//  ScannerVC.swift
//  BarcodeScanner
//
//  Created by ☕️ Gabo.montero on 5/12/24.
//

import UIKit
import AVFoundation // .. interaction with camera, video

enum CameraError: String {
    case invalidDeviceInput
    case invalidScannedValue
}

protocol ScannerVCDelegate: AnyObject {
    func didFind(barcode: String) // .. fires off whe we successfuly found a barcode
    func didSurfaceError(error: CameraError) // .. to fires off if we found an error
}

final class ScannerVC: UIViewController {
    let captureSession = AVCaptureSession() // .. capture what's on the camera
    var previewLayer: AVCaptureVideoPreviewLayer? // .. the preview displayed by the camera
    /**
     * `weak`
     * ---
     * To declare a delegate property or variable that will not be retained by the runtime
     * - Swift will no retain the delegate instance assigned to it.
     * - This ensures that the delegate instance can be deallocated without causing a `strong cycle`.
     * - In this case, the delegate's owner ( the view controller `UIViewController` ) will still retain it,
     *   so there are not memory leaks to worry about.
     */
    weak var scannerDelegate: ScannerVCDelegate?
    
    init(scannerDelegate: ScannerVCDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.scannerDelegate = scannerDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // .. to call the capture session
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureSession()
    }
    
    // .. we setup the preview layer after all subviews are ready
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // .. if we dont have a preview layer yet
        guard let previewLayer = previewLayer else {
            scannerDelegate?.didSurfaceError(error: .invalidDeviceInput)
            return
        }
        
        // .. make the preview layer match the size we declared
        previewLayer.frame = view.layer.bounds
    }
    
    private func setupCaptureSession() {
        // .. do we have a device that can capture video?
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            scannerDelegate?.didSurfaceError(error: .invalidDeviceInput)
            return
        }
        
        let videoInput: AVCaptureDeviceInput
        
        do {
            try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            scannerDelegate?.didSurfaceError(error: .invalidDeviceInput)
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            scannerDelegate?.didSurfaceError(error: .invalidDeviceInput)
            return
        }
        
        let metaDataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metaDataOutput) {
            captureSession.addOutput(metaDataOutput)
            metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metaDataOutput.metadataObjectTypes = [.ean8, .ean13] // .. look for this kind of barcodes
        } else {
            scannerDelegate?.didSurfaceError(error: .invalidDeviceInput)
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        // .. whatever view we create, fill that view (with the video preview) but keep aspect ratio
        previewLayer!.videoGravity = .resizeAspectFill // .. we force unwrap, abort if nil
        view.layer.addSublayer(previewLayer!) // .. we force unwrap, abort if nil
        
        captureSession.startRunning() // .. finally start the camera, to see the preview
    }
}

// .. what to do when we actually scan the barcode?
extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(
        _ output: AVCaptureMetadataOutput,
        didOutput metadataObjects: [AVMetadataObject], // .. the barcodes that we scanned
        from connection: AVCaptureConnection // .. the connection that we setup
    ) {
        guard let object = metadataObjects.first else {
            scannerDelegate?.didSurfaceError(error: .invalidScannedValue)
            return
        }
        
        // .. we cast the object, to get the barcode information detected
        guard let machineReadableObject = object as? AVMetadataMachineReadableCodeObject else {
            scannerDelegate?.didSurfaceError(error: .invalidScannedValue)
            return
        }
        
        // .. we want the barcode string attached
        guard let barcode = machineReadableObject.stringValue else {
            scannerDelegate?.didSurfaceError(error: .invalidScannedValue)
            return
        }
        
        scannerDelegate?.didFind(barcode: barcode)
    }
}
