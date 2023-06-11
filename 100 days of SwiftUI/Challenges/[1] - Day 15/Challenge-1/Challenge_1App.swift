//
//  Challenge_1App.swift
//  Challenge-1
//
//  Created by Tino Krzelj on 18/04/2023.
//

import SwiftUI

@main
struct Challenge_1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(timeConversionService: TimeConversionService())
        }
    }
}
