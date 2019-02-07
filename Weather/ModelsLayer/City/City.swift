//
//  City.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation
import CoreLocation

struct City: Codable {
    
    let id: Int64
    let name: String
    let country: String
    
    let coord: Coordinates
    
    var location: CLLocation {
        return CLLocation(latitude: coord.lat,
                          longitude: coord.lon)
    }
}

// MARK: - Components
extension City {
    
    struct Coordinates: Codable {
        
        let lon: Double
        let lat: Double
    }
}
