//
//  ScannerViewController.swift
//  barcode_scanner
//
//  Created by Tino Krzelj on 02/10/2023.
//

import UIKit
import AVFoundation

// Step 1

protocol ScannerViewControllerDelegate: AnyObject {
    func didFind(barcode: String)
    func throwError(message: ScannerVCError)
}

final class ScannerViewController: UIViewController {
    
    // MARK: - Properties
    
    private let captureSession = AVCaptureSession()
    private var previewLayer: AVCaptureVideoPreviewLayer?
    weak var delegate: ScannerViewControllerDelegate?
    
    // MARK: - Methods
    
    private func setupCaptureSession() {
        guard let videoCaputreDevice = AVCaptureDevice.default(for: .video) else {
            delegate?.throwError(message: .invalidDeviceInput)
            return
        }
        
        let videoInput: AVCaptureDeviceInput
        
        do {
            try videoInput = AVCaptureDeviceInput(device: videoCaputreDevice)
        } catch {
            delegate?.throwError(message: .invalidDeviceInput)
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            delegate?.throwError(message: .invalidDeviceInput)
            return
        }
        
        let metaDataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metaDataOutput) {
            captureSession.addOutput(metaDataOutput)
            metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metaDataOutput.metadataObjectTypes = [.ean8, .ean13]
        } else {
            delegate?.throwError(message: .invalidDeviceInput)
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer?.videoGravity = .resizeAspectFill
        
        guard let unwrappedPreviewLayer = previewLayer else {
            return
        }
        
        view.layer.addSublayer(unwrappedPreviewLayer)
        captureSession.startRunning()
    }
    
    // MARK: - Inits
    
    init(delegate: ScannerViewControllerDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureSession()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let previewLayer = previewLayer else {
            delegate?.throwError(message: .invalidDeviceInput)
            return
        }
        previewLayer.frame = view.layer.bounds
    }
    
}

// MARK: - Extension AVCaptureMetadataOutputObjectsDelegate

extension ScannerViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let hit = metadataObjects.first else {
            delegate?.throwError(message: .invalidScannedValue)
            return
        }
        
        guard let machineReadableObject = hit as? AVMetadataMachineReadableCodeObject else {
            delegate?.throwError(message: .invalidScannedValue)
            return
        }
        
        guard let barcode = machineReadableObject.stringValue else {
            delegate?.throwError(message: .invalidScannedValue)
            return
        }
        
        delegate?.didFind(barcode: barcode)
        captureSession.stopRunning()
    }
}
