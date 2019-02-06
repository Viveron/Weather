//
//  HomeViewController.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit

final class HomeViewController: TabBarController<HomeViewOutput> {
    
    private let factory = HomeControllersFactory()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureApperance()
        configure(with: output.items)
        
        output.viewDidLoad()
    }
    
    // MARK: - Private methods
    
    private func configureApperance() {
        // way to avoid iOS 12.* UITabBar' lags
        tabBar.isTranslucent = false
        
        tabBar.tintColor = HomeTabBarItem.Appearance.selectedTintColor
        tabBar.unselectedItemTintColor = HomeTabBarItem.Appearance.normalTintColor
    }
    
    private func configure(with items: [HomeTabBarItem]) {
        viewControllers = items.map {
            factory.makeViewController(at: $0)
        }
    }
}

// MARK: - HomeViewInput
extension HomeViewController: HomeViewInput {
    
}
