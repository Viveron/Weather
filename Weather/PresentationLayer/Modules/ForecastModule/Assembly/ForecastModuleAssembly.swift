//
//  ForecastModuleAssembly.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit

final class ForecastModuleAssembly {
    
    static func createModule() -> UIViewController {
        let viewModel = ForecastViewModel(storageService: ApplicationAssembly.storageService)
        let view = ForecastViewController(viewModel)
        
        viewModel.input = view
        
        return view
    }
}
