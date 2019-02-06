//
//  HomeTabBarModel.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

final class HomeViewModel: HomeViewOutput {
    
    // MARK: - Module components
    
    weak var input: HomeViewInput?
    
    // MARK: - HomeViewOutput
    
    let items: [HomeTabBarItem] =  [.today, .forecast]
    
    func viewDidLoad() {
        
    }
}
