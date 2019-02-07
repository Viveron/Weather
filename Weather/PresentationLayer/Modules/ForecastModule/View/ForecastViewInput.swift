//
//  ForecastViewInput.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

protocol ForecastViewInput: class {
    
    func configure(title: String?)
    func configure(items: [ForecastSectionItem])
}
