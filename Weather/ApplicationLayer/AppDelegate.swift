//
//  AppDelegate.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit
import Firebase
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configureServices()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = HomeModuleAssembly.createModule()
        window?.makeKeyAndVisible()
        
        let coordinate = CLLocationCoordinate2D(latitude: 12, longitude: 23)
        
        OpenWeatherMapService().obtainForecast(coordinate) { responce in
            
        }
        
        return true
    }
    
    // MARK: - Private methods
    
    private func configureServices() {
        FirebaseApp.configure()
    }
}
