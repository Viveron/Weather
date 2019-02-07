//
//  TodayViewModel.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

final class TodayViewModel: DataViewModel, TodayViewOutput {
    
    // MARK: - Module components
    
    weak var input: TodayViewInput?
    
    override func processResponce(_ responce: OpenWeatherMapResponce?) {
        super.processResponce(responce)
        
    }
    
    // MARK: - Private methods
}
