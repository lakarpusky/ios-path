//
//  DayWeather.swift
//  SwiftUI-Weather
//
//  Created by ☕️ Gabo.montero on 5/10/24.
//

import Foundation

struct WeatherDay: Identifiable {
    let id = UUID().uuidString
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
}
