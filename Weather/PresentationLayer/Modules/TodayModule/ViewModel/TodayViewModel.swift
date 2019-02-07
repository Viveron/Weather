//
//  TodayViewModel.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

final class TodayViewModel: DataViewModel, TodayViewOutput {
    
    private var actualForecast: OpenWeatherMapResponce.Forecast? = nil
    
    // MARK: - Module components
    
    weak var input: TodayViewInput?
    
    override func processResponce(_ responce: OpenWeatherMapResponce?) {
        super.processResponce(responce)
        
        actualForecast = responce?.list
            .sorted { $0.date < $1.date }
            .filter { Date(timeIntervalSince1970: $0.timestamp).isToday }
            .first {
                Date(timeIntervalSince1970: $0.timestamp).isCloseToNow
            }
        
        input?.configure(city: responce?.city,
                         forecast: actualForecast)
    }
    
    // MARK: - TodayViewOutput
    
    func shareActualForecast() {
        guard let city = responce?.city, let forecast = actualForecast else {
            return
        }
        
        // Example of share content
        let weather = "\(city.name), \(city.country) | \(lroundf(forecast.main.temp))" + .celsius
        
        input?.openActivityModule(with: [weather])
    }
}
