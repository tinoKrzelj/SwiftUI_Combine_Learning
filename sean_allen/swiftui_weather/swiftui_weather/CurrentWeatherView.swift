//
//  CurrentWeatherView.swift
//  swiftui_weather
//
//  Created by Tino Krzelj on 27/09/2023.
//

import SwiftUI

struct CurrentWeatherView: View {

    @State private var isNight = false
    
    var body: some View {
            ZStack {
                BackgroundView(isNight: isNight)
                
                VStack {
                    CityText(name: "Cupertino, CA")
                    
                    CurrentWeatherStatusView(weatherIcon: "cloud.sun.fill", temperature: "34")
                    
                    HStack(spacing: 16) {
                        WeahterDayView(day: "TUE", imageName: "cloud.sun.fill", temp: "28")
                        WeahterDayView(day: "WED", imageName: "sun.max.fill", temp: "32")
                        WeahterDayView(day: "THU", imageName: "wind.snow", temp: "-10")
                        WeahterDayView(day: "FRI", imageName: "cloud.sun.fill", temp: "4")
                        WeahterDayView(day: "SAT", imageName: "wind.snow", temp: "-3")
                    }
                    
                    Spacer()
                    
                    Button {
                        isNight.toggle()
                    } label: {
                        WeatherButton(title: "Change Day Time",
                                      textColor: .black,
                                      backgroundColor: .white)
                    }
                    
                    Spacer()
                }
                .padding()
            }
    }
}

struct WeahterDayView: View {
    var day: String
    var imageName: String
    var temp: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(day)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(.white, .gray)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temp)°")
                .font(.system(size: 25, weight: .semibold))
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityText: View {
    var name: String
    
    var body: some View {
        Text(name)
            .font(.system(size: 32, weight: .semibold, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct CurrentWeatherStatusView: View {
    var weatherIcon: String
    var temperature: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: weatherIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 160, height: 160)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 30)
    }
}
