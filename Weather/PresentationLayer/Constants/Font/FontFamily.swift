//
//  FontFamily.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit

// MARK: - Application's UI fonts protocol
protocol FontFamily {
    
    var fontName: String { get }
}

// MARK: - FontFamily Protocol default implementation
extension FontFamily where Self: RawRepresentable, Self.RawValue == String {
    
    var fontName: String {
        return rawValue
    }
}

// MARK: - UIFont extension for application's UI fonts
extension UIFont {
    
    enum Size: CGFloat {
        /// 10pt font size
        case small  = 10
        /// 12pt font size
        case lite   = 12
        /// 14pt font size
        case medium = 14
        /// 16pt font size
        case normal = 16
        /// 20pt font size
        case big    = 20
        /// 24pt font size
        case extra  = 24
    }
    
    convenience init?(_ fontFamily: FontFamily, size: UIFont.Size) {
        self.init(name: fontFamily.fontName, size: size.rawValue)
    }
    
    convenience init?(_ fontFamily: FontFamily, size: CGFloat) {
        self.init(name: fontFamily.fontName, size: size)
    }
}
