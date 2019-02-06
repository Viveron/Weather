//
//  OpenWeatherMapService.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire

final class OpenWeatherMapService {
    
    func obtainForecast(_ coordinate: CLLocationCoordinate2D,
                        _ completion: ValueBlock<Result<OpenWeatherMapResponce>>? = nil) {
        
        let parameters: Parameters = [
            "lat": coordinate.latitude,
            "lon": coordinate.longitude,
            "appid" : Configuration.appid
        ]
        
        Alamofire.request(Configuration.baseURL, method: .get, parameters: parameters)
            .responseData { response in
                let result: Result<OpenWeatherMapResponce>
                
                if let error = response.error {
                    let failureError: ResponseError = error.isNotConnectedToInternet ? .connectionLost : .unknown
                    result = .failure(failureError)
                } else {
                    result = JSONDecoder().decodeResponse(from: response)
                }
                
                DispatchQueue.main.async {
                    completion?(result)
                }
        }
    }
}

// MARK: - Constants
private enum Configuration {
    
    static let baseURL = "https://api.openweathermap.org/data/2.5/forecast"
    static let appid = "80b9c4594a2b1fe262d27b122f9c1975"
}
