//
//  UIColor+Extensions.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hex: Int, alpha: CGFloat? = nil) {
        self.init(((hex >> 16) & 0xFF),
                  ((hex >> 8)  & 0xFF),
                  (hex        & 0xFF),
                  alpha)
    }
    
    convenience init(_ red: Int,
                     _ green: Int,
                     _ blue: Int,
                     _ alpha: CGFloat? = nil) {
        self.init(red:   CGFloat(red)   / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue:  CGFloat(blue)  / 255.0,
                  alpha: alpha ?? 1.0)
    }
    
    convenience init(_ hexString: String) {
        var string = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (string.hasPrefix("#")) {
            string.remove(at: string.startIndex)
        }
        
        var hex: UInt32 = 0
        Scanner(string: string).scanHexInt32(&hex)
        
        self.init(hex: Int(hex))
    }
}
