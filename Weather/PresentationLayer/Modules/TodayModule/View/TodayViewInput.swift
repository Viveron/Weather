//
//  TodayViewInput.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

protocol TodayViewInput: class {
    
    func configure(city: City?, forecast: OpenWeatherMapResponce.Forecast?)
    
    func openActivityModule(with activityItems: [Any])
}
