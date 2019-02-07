//
//  UIImage+Extensions.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit

extension UIImage {
    
    convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.init(cgImage: (image?.cgImage)!)
    }
    
    static func weatherImage(for weatherIcon: WeatherIcon,
                             size: CGSize,
                             tintColor: UIColor = .black,
                             fontSize: UIFont.Size = .big,
                             adjustsFontSize: Bool = true) -> UIImage? {
        
        let rect = CGRect(origin: .zero, size: size)
        
        let label = UILabel()
        label.frame = rect
        label.font = UIFont(WeatherIcons.regular, size: fontSize)
        label.adjustsFontSizeToFitWidth = adjustsFontSize
        label.textColor = tintColor
        label.textAlignment = .center
        label.text = weatherIcon.text
        
        let container = UIView()
        container.frame = rect
        container.backgroundColor = .clear
        container.addSubview(label)
        container.setNeedsLayout()
        container.layoutIfNeeded()
        container.drawHierarchy(in: rect, afterScreenUpdates: true)
        
        return UIImage(view: container)
    }
}
