//
//  HomeControllersFactory.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit

final class HomeControllersFactory {
    
    func makeViewController(at item: HomeTabBarItem) -> UIViewController {
        let controller: UIViewController
        
        switch item {
        case .today:
            controller = UIViewController()
            
        case .forecast:
            controller = UIViewController()
        }
        
        controller.tabBarItem = makeTabBarItem(at: item)
        controller.title = item.title
        return UINavigationController(rootViewController: controller)
    }
    
    // MARK: - Private methods
    
    private func makeTabBarItem(at item: HomeTabBarItem) -> UITabBarItem {
        let tabBarItem = UITabBarItem(title: item.title,
                                      image: item.appearance.image,
                                      selectedImage: item.appearance.selectedImage)
        
        // as 'Any' for hide precompiler warnings
        let font = item.appearance.titleFont as Any
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: item.appearance.color
        ]
        tabBarItem.setTitleTextAttributes(normalAttributes, for: .normal)
        
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: item.appearance.selectedColor
        ]
        tabBarItem.setTitleTextAttributes(selectedAttributes, for: .selected)
        
        return tabBarItem
    }
}