//
//  ResponseError.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

enum ResponseError: Error {
    
    case unknown
    
    // Invalid mapping
    case mapping
    
    
    // Request timeout or network connection lost
    case connectionLost
}
