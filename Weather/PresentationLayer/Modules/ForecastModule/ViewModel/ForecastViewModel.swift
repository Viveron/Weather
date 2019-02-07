//
//  ForecastViewModel.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

final class ForecastViewModel: DataViewModel, ForecastViewOutput {
    
    // MARK: - Module components
    
    weak var input: ForecastViewInput?
    
    override func processResponce(_ responce: OpenWeatherMapResponce?) {
        super.processResponce(responce)
        
    }
    
    // MARK: - Private methods
}
