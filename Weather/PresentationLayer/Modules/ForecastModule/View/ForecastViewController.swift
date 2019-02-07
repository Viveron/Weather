//
//  ForecastViewController.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

final class ForecastViewController: ViewController<ForecastViewOutput, ForecastView> {
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewDidLoad()
    }
    
    // MARK: - Private methods
    
}

// MARK: - ForecastViewInput
extension ForecastViewController: ForecastViewInput {
    
}
