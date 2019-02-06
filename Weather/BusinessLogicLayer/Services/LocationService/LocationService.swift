//
//  LocationService.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation
import CoreLocation

extension LocationService {
    
    enum Accuracy {
        case `default`
        
        fileprivate func locationAccuracy() -> CLLocationAccuracy {
            return kCLLocationAccuracyThreeKilometers
        }
        
        fileprivate func distanceFilter() -> CLLocationDistance {
            return 3000.0
        }
    }
}

final class LocationService: NSObject {
    
    private var locationManager: CLLocationManager!
    
    var location: CLLocation? {
        return locationManager.location
    }
    
    var accuracy: LocationService.Accuracy = .default {
        didSet {
            updateSettings()
        }
    }
    
    override init() {
        super.init()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        updateSettings()
        
        processAuthorization(status: CLLocationManager.authorizationStatus())
    }
    
    // MARK: - Private methods
    
    private func updateSettings() {
        locationManager.desiredAccuracy = accuracy.locationAccuracy()
        locationManager.distanceFilter = accuracy.distanceFilter()
    }
    
    private func processAuthorization(status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            
        case .authorizedAlways, .authorizedWhenInUse:
            notify(.LocationServiceDidAuthorized)
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingHeading()
            
        case .restricted, .denied:
            notify(.LocationServiceDidDenied)
        }
    }
    
    private func notify(_ name: Notification.Name) {
        NotificationCenter.default.post(name: name, object: nil)
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationService: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        notify(.LocationServiceDidUpdate)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        processAuthorization(status: status)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        notify(.LocationServiceDidFail)
    }
}
