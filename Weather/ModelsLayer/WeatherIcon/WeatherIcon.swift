//
//  WeatherIcon.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

protocol WeatherIcon: Codable {
    
    // UI representation
    var text: String { get }
}

enum DayWeather: String, WeatherIcon {
    case clearSky        = "01d"
    case fewClouds       = "02d"
    case scatteredClouds = "03d"
    case brokenClouds    = "04d"
    case showerRain      = "09d"
    case rain            = "10d"
    case thunderstorm    = "11d"
    case snow            = "13d"
    case mist            = "50d"
}

enum NightWeather: String, WeatherIcon {
    case clearSky        = "01n"
    case fewClouds       = "02n"
    case scatteredClouds = "03n"
    case brokenClouds    = "04n"
    case showerRain      = "09n"
    case rain            = "10n"
    case thunderstorm    = "11n"
    case snow            = "13n"
    case mist            = "50n"
}

enum GeneralWeather: UniChar, WeatherIcon {
    // N/A
    case none = 0xf07b
    
    // UI elements
    case sunny     = 0xf00d
    case lightning = 0xf025
    case degrees   = 0xf042
    
    // Units
    case cloudiness = 0xf019
    case windSpeed  = 0xf050
    case rainVolume = 0xf078
    case celsius    = 0xf03c
    case direction  = 0xf0b1
}

// MARK: - WeatherIcon Protocol default implementation for String
extension WeatherIcon where Self: RawRepresentable, Self.RawValue == String {
    
    var text: String {
        return WeatherFormatter.formattedSring(rawValue)
    }
}

// MARK: - WeatherIcon Protocol default implementation for UniChar
extension WeatherIcon where Self: RawRepresentable, Self.RawValue == UniChar {
    
    var text: String {
        return WeatherFormatter.formattedUniChar(rawValue)
    }
}

private final class WeatherFormatter {
    
    static let uniChars: [String: UniChar] = [
        DayWeather.clearSky.rawValue        : 0xf00d,
        DayWeather.fewClouds.rawValue       : 0xf002,
        DayWeather.scatteredClouds.rawValue : 0xf041,
        DayWeather.brokenClouds.rawValue    : 0xf013,
        DayWeather.showerRain.rawValue      : 0xf009,
        DayWeather.rain.rawValue            : 0xf008,
        DayWeather.thunderstorm.rawValue    : 0xf010,
        DayWeather.snow.rawValue            : 0xf00a,
        DayWeather.mist.rawValue            : 0xf014,

        NightWeather.clearSky.rawValue        : 0xf02e,
        NightWeather.fewClouds.rawValue       : 0xf086,
        NightWeather.scatteredClouds.rawValue : 0xf041,
        NightWeather.brokenClouds.rawValue    : 0xf013,
        NightWeather.showerRain.rawValue      : 0xf029,
        NightWeather.rain.rawValue            : 0xf028,
        NightWeather.thunderstorm.rawValue    : 0xf06d,
        NightWeather.snow.rawValue            : 0xf038,
        NightWeather.mist.rawValue            : 0xf014
    ]
    
    static func formattedSring(_ rawValue: String) -> String {
        if let uniChar = uniChars[rawValue] {
            return formattedUniChar(uniChar)
        }
        return .empty
    }
    
    static func formattedUniChar(_ rawValue: UniChar) -> String {
        return String(format: "%C", rawValue)
    }
}
