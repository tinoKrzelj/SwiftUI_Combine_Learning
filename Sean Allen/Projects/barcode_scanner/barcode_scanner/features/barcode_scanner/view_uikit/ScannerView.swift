//
//  ScannerView.swift
//  barcode_scanner
//
//  Created by Tino Krzelj on 02/10/2023.
//

import SwiftUI

// Step 2

struct ScannerView: UIViewControllerRepresentable {
    
    // MARK: - Bindings
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    typealias UIViewControllerType = ScannerViewController
    
    func makeUIViewController(context: Context) -> ScannerViewController {
        ScannerViewController(delegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    // MARK: - Coordinator
    
    final class Coordinator: NSObject, ScannerViewControllerDelegate {
        
        private let scannerView: ScannerView
        
        func didFind(barcode: String) {
            scannerView.scannedCode = barcode
        }
        
        func throwError(message: ScannerVCError) {
            switch message {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannerView.alertItem = AlertContext.invalidScannedValue
            }
        }
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(scannedCode: .constant("Test"), alertItem: .constant(nil))
    }
}
