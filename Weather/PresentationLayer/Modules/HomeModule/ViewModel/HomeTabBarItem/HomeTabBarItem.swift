//
//  HomeTabBarItem.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit

enum HomeTabBarItem: String {
    
    case today    = "Today"
    case forecast = "Forecast"
    
    var title: String {
        return rawValue
    }
    
    var image: UIImage? {
        let icon: GeneralWeather
        switch self {
        case .today:
            icon = .sunny
        
        case .forecast:
            icon = .lightning
        }
        
        return UILabel.weatherImage(for: icon,
                                    imageSize: CGSize(width: 30, height: 30))
    }
}
