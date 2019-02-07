//
//  Demon.swift
//  Weather
//
//  Created by Victor Shabanov on 07/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

protocol Demon {
    
    var isStarted: Bool { get }
    
    func start()
    func stop()
}
