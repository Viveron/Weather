//
//  ForecastTableViewCellItem.swift
//  Weather
//
//  Created by Victor Shabanov on 07/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

struct ForecastTableViewCellItem {
    
    let temp: Float
    let date: Date
    let weatherIcon: WeatherIcon
    let description: String
    
    var isActual: Bool = false
    
    init(forecast: OpenWeatherMapResponce.Forecast) {
        temp = forecast.main.temp
        date = Date(timeIntervalSince1970: forecast.timestamp)
        
        if let weather = forecast.weather.first {
            description = weather.description.capitalized
            weatherIcon = weather.fontIcon
        } else {
            description = .empty
            weatherIcon = GeneralWeather.none
        }
    }
}
