//
//  WeatherModel.swift
//  RainCheck
//
//  Created by Pranav Karthik on 2022-09-17.
//

struct WeatherModel: Codable {
    let data: WeatherData
}

struct WeatherData: Codable {
    let timelines: [WeatherTimelines]
}

struct WeatherTimelines: Codable {
    let intervals: [WeatherIntervals]
}

struct WeatherIntervals: Codable {
    let startTime: String
    let values: WeatherValue
}

struct WeatherValue: Codable {
    var temperature: Double
    var weatherCode: Int
}

import SwiftUI

enum WeatherCode: String, Codable {
    case drizzle = "4000"
    case rain = "4001"
    case lightRain = "4200"
    case heavyRain = "4201"
    case freezingDrizzle = "6000"
    case freezingRain = "6001"
    case lightFreezingRain = "6200"
    case heavyFreezingRain = "6201"
    case thunderstorm = "8000"
    
    var description: String {
        switch self {
        case .drizzle, .lightRain:
            return "A bit of rain,\n don't forget your umbrella!"
        case .rain, .heavyRain:
            return "Rainy today,\n don't forget your umbrella!"
        case .freezingDrizzle:
            return "So cold brrr! Keep warm!"
        case .freezingRain, .lightFreezingRain, .heavyFreezingRain:
            return "Drive safe, the roads might be slippery!"
        case .thunderstorm:
            return "Try to stay inside!\n Thunderstorm alert!"
        default:
            return "No rain today!"
        }
    }
    
    var image: Image {
        switch self {
        case .drizzle:
            return Image(systemName: "cloud.drizzle.fill")
        case .lightRain, .rain:
            return Image(systemName: "cloud.rain.fill")
        case .heavyRain:
            return Image(systemName: "cloud.heavyrain.fill")
        case .freezingDrizzle:
            return Image(systemName: "thermometer.snowflake")
        case .freezingRain, .lightFreezingRain, .heavyFreezingRain:
            return Image(systemName: "cloud.rain.fill")
        case .thunderstorm:
            return Image(systemName: "cloud.bolt.fill")
        default:
            return Image(systemName: "sun")
        }
    }
}

struct Weather: Identifiable {
    let id = UUID()
    
    let temperature: Int
    let weatherCode: WeatherCode
}
