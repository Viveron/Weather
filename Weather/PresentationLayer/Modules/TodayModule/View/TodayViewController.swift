//
//  TodayViewController.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit

final class TodayViewController: ViewController<TodayViewOutput, TodayView> {
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shareBarButtonItem = UIBarButtonItem(title: "Share",
                                                 style: .plain,
                                                 target: self,
                                                 action: #selector(rightBarButtonItemAction))
        shareBarButtonItem.tintColor = .oran
        
        navigationItem.title = HomeTabBarItem.today.title
        navigationItem.rightBarButtonItem = shareBarButtonItem
        
        output.viewDidLoad()
    }
    
    // MARK: - Private methods
    
    @objc private func rightBarButtonItemAction() {
        output.shareActualForecast()
    }
}

// MARK: - TodayViewInput
extension TodayViewController: TodayViewInput {
    
    func configure(city: City?, forecast: OpenWeatherMapResponce.Forecast?) {
        customView.locationView.configure(city: city, forecast: forecast)
        customView.plateView.configure(forecast: forecast)
    }
    
    func openActivityModule(with activityItems: [Any]) {
        let controller = UIActivityViewController(activityItems: activityItems,
                                                  applicationActivities: nil)
        present(controller, animated: true)
    }
}
