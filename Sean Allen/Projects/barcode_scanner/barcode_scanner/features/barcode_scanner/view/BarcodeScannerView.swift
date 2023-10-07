//
//  BarcodeScannerView.swift
//  barcode_scanner
//
//  Created by Tino Krzelj on 02/10/2023.
//

import SwiftUI

struct AlertItem {
    let title: String
    let message: String
    let dismissButton: String
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input",
                                              message: "Something is wrong with camera :/",
                                              dismissButton: "Dismiss")
    static let invalidScannedValue = AlertItem(title: "Invalid Scanned Value",
                                              message: "Value scanned not valid. Only scans EAN-8 & EAN-13",
                                              dismissButton: "Dismiss")
}

struct BarcodeScannerView: View {
    
    // MARK: - StateObject
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
//    @State private var scannedCode = ""
//    @State private var alertItem: AlertItem?
    @State private var isErrorAlertShown = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // Step 3
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                    .frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(viewModel.statusTextColor)
                    .padding()
            }
            
            .navigationTitle("Barcode Scanner")
            // Alert nije zavrsen jer on koristi approach koji je izbacen u novim verzijama :(
//            .alert(<#T##titleKey: LocalizedStringKey##LocalizedStringKey#>, isPresented: <#T##Binding<Bool>#>, presenting: <#T##T?#>, actions: <#T##(T) -> View#>)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
