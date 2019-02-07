//
//  HomeModuleAssembly.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit

final class HomeModuleAssembly {
    
    static func createModule() -> UIViewController {
        let viewModel = HomeViewModel(forecastService: ApplicationAssembly.forecastService)
        let view = HomeViewController(viewModel)
        
        viewModel.input = view
        
        return view
    }
}
