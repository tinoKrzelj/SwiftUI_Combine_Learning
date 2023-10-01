//
//  WeatherButton.swift
//  swiftui_weather
//
//  Created by Tino Krzelj on 27/09/2023.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .font(.system(size: 20, weight: .bold))
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(10.0)
    }
}
