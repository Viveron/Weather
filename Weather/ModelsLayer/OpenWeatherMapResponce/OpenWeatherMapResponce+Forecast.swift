//
//  OpenWeatherMapResponce+Forecast.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

extension OpenWeatherMapResponce {
    
    struct Forecast: Decodable {
        
        let date: String
        let timestamp: TimeInterval
        
        let main: Main
        let weather: [Weather]
        let clouds: Clouds
        let wind: Wind
        let rain: Rain?
        
        enum CodingKeys: String, CodingKey {
            case date = "dt_txt"
            case timestamp = "dt"
            case main
            case weather
            case clouds
            case wind
            case rain
        }
    }
}

// MARK: - Components
extension OpenWeatherMapResponce.Forecast {
    
    struct Main: Decodable {
        
        let temp: Float
        let pressure: Float
        let humidity: Float
    }
    
    struct Weather: Decodable {
        
        let icon: String
        let description: String
    }
    
    struct Clouds: Decodable {
        
        let value: Float
        
        enum CodingKeys: String, CodingKey {
            case value = "all"
        }
    }
    
    struct Wind: Decodable {
        
        let speed: Float
        let deg: Float
    }
    
    struct Rain: Decodable {
        
        let value: Float?
        
        enum CodingKeys: String, CodingKey {
            case value = "3h"
        }
    }
}
