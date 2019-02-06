//
//  TabBarController.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit

class TabBarController<OutputType>: UITabBarController {
    
    // MARK: - Module components
    
    let output: OutputType
    
    init(_ output: OutputType) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
