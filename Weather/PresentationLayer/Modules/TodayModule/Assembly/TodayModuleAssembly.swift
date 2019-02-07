//
//  TodayModuleAssembly.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit

final class TodayModuleAssembly {
    
    static func createModule() -> UIViewController {
        let viewModel = TodayViewModel()
        let view = TodayViewController(viewModel)
        
        viewModel.input = view
        
        return view
    }
}
