//
//  StorageServiceObserver.swift
//  Weather
//
//  Created by Victor Shabanov on 07/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

class StorageServiceObserver: NSObject {
    
    let update: ValueBlock<OpenWeatherMapResponce?>
    
    internal init(_ closure: @escaping ValueBlock<OpenWeatherMapResponce?>) {
        self.update = closure
    }
}
