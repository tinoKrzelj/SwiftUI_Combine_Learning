//
//  ContentView.swift
//  WeSplit
//
//  Created by Tino Krzelj on 18/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - State Properties
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage: Double = 0
    @FocusState private var amountIsFocused: Bool
    
    let weSplitCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currencyCode ?? "USD")
    
    // MARK: - Properties
    
    let tipPercentages = [0, 10, 15, 20, 25]
    
    private var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = (checkAmount / 100) * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    
    private var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 1)
        let amountPerPerson = grandTotal/peopleCount
        return amountPerPerson
    }
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            Form {
                Section("Check Amount") {
                    TextField("Amount", value: $checkAmount, format: weSplitCurrency)
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                }
                
                Section("Number of people") {
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(1..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                //Section("How much tip you want to leave?") {
//                    Picker("Select Tip Percentage", selection: $tipPercentage) {
//                        ForEach(tipPercentages, id: \.self) {
//                            Text("\($0)%")
//                        }
//                    }.pickerStyle(.automatic)
                Section("How much tip you want to leave? (0-100%)") {
                    Slider(value: $tipPercentage, in: 0...100, step: 1)
                    Text("Selected tip is \(Int(tipPercentage))%")
                }
                        
                //}
                
                Section("Amount per person") {
                    Text(totalPerPerson, format: weSplitCurrency)
                }
                
                Section("Grand Total") {
                    Text(grandTotal, format: weSplitCurrency)
                }
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
