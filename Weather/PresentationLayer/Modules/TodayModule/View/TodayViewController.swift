//
//  TodayViewController.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

final class TodayViewController: ViewController<TodayViewOutput, TodayView> {
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = HomeTabBarItem.today.title
        output.viewDidLoad()
    }
    
    // MARK: - Private methods
    
}

// MARK: - TodayViewInput
extension TodayViewController: TodayViewInput {
    
}
