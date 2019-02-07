//
//  ApplicationAssembly.swift
//  Weather
//
//  Created by Victor Shabanov on 07/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

final class ApplicationAssembly {
    
    static var storageService: StorageService = {
        return StorageService()
    }()
    
    static var locationService: LocationService = {
        return LocationService()
    }()
    
    static var forecastService: ForecastService = {
        return ForecastService(storageService: storageService,
                               locationService: locationService,
                               openWeatherMapService: OpenWeatherMapService())
    }()
}
