//
//  ContentView.swift
//  Challenge-1
//
//  Created by Tino Krzelj on 18/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - State Properties
    
    @State private var selectedConversionFrom: TimeConversionType = .minute
    @State private var selectedConversionTo: TimeConversionType = .second
    @State private var conversationFromValue = ""
    @State private var conversationToValue = ""
    @FocusState private var convertFromTextfieldFocus: Bool
    
    // MARK: - Dependencies
    
    private var timeConversionService: TimeConversionServiceContractor
        
    // MARK: - Methods
    
    private func convertTime(from: TimeConversionType, to: TimeConversionType, value: String) -> String {
        switch from {
        case .second:
            return timeConversionService.convertFromSeconds(value: value, to: to)
        case .minute:
            return timeConversionService.convertFromMinutes(value: value, to: to)
        case .hour:
            return timeConversionService.convertFromHours(value: value, to: to)
        case .day:
            return timeConversionService.convertFromDays(value: value, to: to)
        }
    }
    
    // MARK: - Inits (DI)
    
    init(timeConversionService: TimeConversionServiceContractor) {
        self.timeConversionService = timeConversionService
    }
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            Form {
                Section("Convert From") {
                    Picker("Convert From", selection: $selectedConversionFrom) {
                        ForEach(TimeConversionType.allCases, id: \.self) {
                            Text($0.stringValue())
                        }
                    }.pickerStyle(.segmented)
                    
                    TextField("Enter \(selectedConversionFrom.stringValue())", text: $conversationFromValue)
                        .keyboardType(.numberPad)
                        .focused($convertFromTextfieldFocus)
                }
                
                Section("Convert To") {
                    Picker("Convert To", selection: $selectedConversionTo) {
                        ForEach(TimeConversionType.allCases, id: \.self) {
                            Text($0.stringValue())
                        }
                    }.pickerStyle(.segmented)
                    
                    let convertedValue = convertTime(from: selectedConversionFrom, to: selectedConversionTo, value: conversationFromValue)
                
                    Text("\(convertedValue.timeConversionRounded) \(selectedConversionTo.stringValue())")
                }
                
                .navigationTitle("Time Conversion")
                .navigationBarTitleDisplayMode(.large)
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Finish") {
                        convertFromTextfieldFocus = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(timeConversionService: TimeConversionService())
    }
}
