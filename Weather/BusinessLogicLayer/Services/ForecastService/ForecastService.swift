//
//  ForecastService.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation
import CoreLocation

final class ForecastService {
    
    private let storageService: StorageService
    private let locationService: LocationService
    private let openWeatherMapService: OpenWeatherMapService
    
    private let lock = NSLock()
    private let defaults = UserDefaults.standard
    private let notificationCenter = NotificationCenter.default
    
    private lazy var obtainForecastQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        queue.name = "weather.demo.obtain.forecast.queue"
        queue.qualityOfService = .background
        
        return queue
    }()
    
    private var currentCity: City? {
        set {
            let data = try? JSONEncoder().encode(newValue)
            defaults.set(data, forKey: .currenCityKey)
        }
        get {
            if let data = defaults.data(forKey: .currenCityKey) {
                return try? JSONDecoder().decode(City.self, from: data)
            }
            return nil
        }
    }
    
    private var updationDate: Date? {
        set {
            defaults.set(newValue?.timeIntervalSince1970,
                         forKey: .updationDateKey)
        }
        get {
            let interval = defaults.double(forKey: .updationDateKey)
            return interval > 0 ? Date(timeIntervalSince1970: interval) : nil
        }
    }
    
    init(storageService: StorageService,
         locationService: LocationService,
         openWeatherMapService: OpenWeatherMapService) {
        
        self.storageService = storageService
        self.locationService = locationService
        self.openWeatherMapService = openWeatherMapService
        
        subscribe()
    }
    
    // MARK: - Private methods
    
    private func subscribe() {
        notificationCenter.addObserver(self,
                                       selector: #selector(locationServiceDidUpdatedAction),
                                       name: .LocationServiceDidUpdated,
                                       object: nil)
        
        notificationCenter.addObserver(self,
                                       selector: #selector(timerDemonDidFiredAction),
                                       name: .TimerDemonDidFired,
                                       object: nil)
    }
    
    private func obtainForecats(_ location: CLLocation, newCity: Bool = false) {
        lock.lock()
        
        guard newCity || needUpdateForecast() else {
            lock.unlock()
            return
        }
        
        openWeatherMapService.obtainForecast(location.coordinate) { [weak self] result in
            switch result {
            case let .success(responce):
                self?.currentCity = responce.city
                self?.updationDate = Date()
                self?.storageService.update(with: responce)
                
            case .failure:
                if newCity {
                    self?.storageService.update(with: nil)
                }
            }
            
            self?.lock.unlock()
        }
    }
    
    private func needUpdateForecast() -> Bool {
        if let date = updationDate, abs(date.timeIntervalSince(Date())) < .day {
            // is not tommorow - updation is no needed
            return false
        }
        
        return true
    }
    
    // MARK: - Actions
    
    @objc private func locationServiceDidUpdatedAction() {
        let operation = BlockOperation { [weak self] in
            guard let location = self?.locationService.location,
                  let accuracy = self?.locationService.accuracy else {
                return
            }
            
            if let city = self?.currentCity {
                let distance = city.location.distance(from: location)
                if  distance < accuracy.distanceFilter {
                    // same city - updation is no needed
                    return
                }
            }
            
            self?.obtainForecats(location, newCity: true)
        }
        
        obtainForecastQueue.addOperation(operation)
    }
    
    @objc private func timerDemonDidFiredAction() {
        let operation = BlockOperation { [weak self] in
            guard let strongSelf = self, strongSelf.needUpdateForecast() else {
                return
            }
            
            if let location = strongSelf.locationService.location {
                strongSelf.obtainForecats(location)
            }
        }
        
        obtainForecastQueue.addOperation(operation)
    }
}

// MARK: - Constnats

private extension TimeInterval {
    
    static let day: TimeInterval = 24 * 60 * 60
}

private extension String {
    
    static let currenCityKey = "currenCityKey"
    static let updationDateKey = "updationDateKey"
}
