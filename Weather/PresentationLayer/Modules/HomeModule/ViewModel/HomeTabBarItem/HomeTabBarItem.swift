//
//  HomeTabBarItem.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

enum HomeTabBarItem: String {
    
    case today    = "Today"
    case forecast = "Forecast"
    
    var title: String {
        return rawValue
    }
    
    var appearance: Appearance {
        switch self {
        case .today:
            return Appearance(symbolCode: .empty)
            
        case .forecast:
            return Appearance(symbolCode: .empty)
        }
    }
}
