//
//  HomeTabBarModel.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit

final class HomeViewModel: HomeViewOutput {
    
    private let forecastService: ForecastService
    private let notificationCenter = NotificationCenter.default
    
    // MARK: - Module components
    
    weak var input: HomeViewInput?
    
    let items: [HomeTabBarItem] =  [.today, .forecast]
    
    init(forecastService: ForecastService) {
        self.forecastService = forecastService
    }
    
    // MARK: - HomeViewOutput
    
    func viewDidLoad() {
        notificationCenter.addObserver(forName: .LocationServiceDidDenied, object: nil, queue: .main) { [weak self] _ in
            self?.input?.showLocationServiceDeniedAlert()
        }
    }
    
    func openAppSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
