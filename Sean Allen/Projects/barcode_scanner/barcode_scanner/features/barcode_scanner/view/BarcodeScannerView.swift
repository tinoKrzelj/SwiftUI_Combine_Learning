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
    
    @State private var scannedCode = ""
    @State private var alertItem: AlertItem?
    @State private var isErrorAlertShown = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // Step 3
                ScannerView(scannedCode: $scannedCode, alertItem: $alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                    .frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(scannedCode.isEmpty ? "Not yet scanned" : scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(scannedCode.isEmpty ? .red : .green)
                    .padding()
            }
            
            .navigationTitle("Barcode Scanner")
            .alert(<#T##titleKey: LocalizedStringKey##LocalizedStringKey#>, isPresented: <#T##Binding<Bool>#>, presenting: <#T##T?#>, actions: <#T##(T) -> View#>)
            
            Nastaviti 5:02:45
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
