//
//  HomeViewController.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit

final class HomeViewController: UITabBarController {
    
    private let factory = HomeControllersFactory()
    
    // MARK: - Module components
    
    let output: HomeViewOutput
    
    init(_ output: HomeViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureApperance()
        configure(with: [.today, .forecast])
    }
    
    // MARK: - Private methods
    
    private func configureApperance() {
        // way to avoid iOS 12.* UITabBar' lags
        tabBar.isTranslucent = false
    }
}

// MARK: - HomeViewInput
extension HomeViewController: HomeViewInput {
    
    func configure(with items: [HomeTabBarItem]) {
        viewControllers = items.map {
            factory.makeViewController(at: $0)
        }
    }
}
