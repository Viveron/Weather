//
//  HomeTabBarItem+Appearance.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit

extension HomeTabBarItem {
    
    struct Appearance {
        
        let image: UIImage?
        let color: UIColor = .black
        
        let selectedImage: UIImage?
        let selectedColor: UIColor = .blue
        
        let titleFont = UIFont(Roboto.medium, size: .normal)
        
        init(symbolCode: String) {
            
            image = nil
            selectedImage = nil
        }
    }
}
