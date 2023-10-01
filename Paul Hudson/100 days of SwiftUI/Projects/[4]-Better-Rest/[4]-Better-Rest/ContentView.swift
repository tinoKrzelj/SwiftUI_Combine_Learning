//
//  ContentView.swift
//  [4]-Better-Rest
//
//  Created by Tino Krzelj on 13/05/2023.
//

import SwiftUI
import CoreML

struct ContentView: View {
    
    // MARK: - State Properties
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount: Double = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var alertVisible = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    // MARK: - Methods
    
    private func calculateBedtime() {
        do {
            let configuration = MLModelConfiguration()
            let model = try BetterSleep(configuration: configuration)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60 // in seconds
            let minute = (components.minute ?? 0) * 60 // in seconds
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            alertMessage = "Bedtime: \(sleepTime.formatted(date: .omitted, time: .shortened))"
        } catch let err {
            alertTitle = "Error"
            alertMessage = err.localizedDescription
            alertVisible = true
        }
    }
        
    // MARK: - View Protocol
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("When do you want to wake up?")
                            .font(.headline)
                        DatePicker("Please enter the time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Desired amount of sleep")
                            .font(.headline)
                        
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("How much coffee have you had?")
                            .font(.headline)
                        
                        //Picker(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20, step: 1)
                        Picker("Coffe ammount", selection: $coffeeAmount) {
                            ForEach(1...20, id: \.self) { index in
                                Text("\(index) cup/s")
                            }
                        }
                        .pickerStyle(.wheel)
                        .labelsHidden()
                    }
                }
                
                Spacer()
                Text(alertMessage)
                    .font(.largeTitle)
                    .background(.clear)
                    .padding(.bottom)
            }
            .navigationTitle("BetterRest")
            .toolbar{
                Button("Calculate", action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $alertVisible) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
