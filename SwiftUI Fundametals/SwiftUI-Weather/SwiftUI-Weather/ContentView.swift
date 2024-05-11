//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by ☕️ Gabo.montero on 5/10/24.
//

import SwiftUI

/**
 * CHALLENGES
 * ---
 * ✅ 1. Build model and refactor HStack with an array
 * 2. Get real data from a weather API `https://open-meteo.com/`
 * 3. Build a TabBar that shows multiple cities
 */

struct ContentView: View {
    @State private var isNight = false
    
    let days: [WeatherDay] = [
        WeatherDay(dayOfWeek: "TUE",imageName: "cloud.sun.fill", temperature: 74),
        WeatherDay(dayOfWeek: "WED",imageName: "sun.max.fill", temperature: 88),
        WeatherDay(dayOfWeek: "THU",imageName: "wind.snow", temperature: 55),
        WeatherDay(dayOfWeek: "FRI",imageName: "sunset.fill", temperature: 60),
        WeatherDay(dayOfWeek: "SAT",imageName: "snow", temperature: 25)
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(
                    imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                    temperature: 76
                )
                
                HStack(spacing: 20) {
                    ForEach(days) { item in
                        WeatherDayView(weather: item)
                    }
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(
                        title: "Change Day Time",
                        textColor: .black,
                        backgroundColor: .mint
                    )
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    let weather: WeatherDay
    
    var body: some View {
        VStack {
            Text(weather.dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
            
            Image(systemName: weather.imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(weather.temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(
//            gradient: Gradient(
//                colors: [
//                    isNight ? .black : .blue,
//                    isNight ? .gray : Color("lightBlue")
//                ]
//            ),
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing
//        )
//        .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    let cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    let imageName: String
    let temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}
