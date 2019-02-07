//
//  OpenWeatherMapResponce.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

struct OpenWeatherMapResponce: Codable {
    
    let city: City
    let list: [Forecast]
}
