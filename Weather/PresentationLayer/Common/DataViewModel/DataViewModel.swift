//
//  DataViewModel.swift
//  Weather
//
//  Created by Victor Shabanov on 07/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

class DataViewModel: ViewOutput {
    
    private let storageService: StorageService
    
    init(storageService: StorageService) {
        self.storageService = storageService
    }
    
    // MARK: - ViewOutput
    
    func viewDidLoad() {
        storageService.addObserver { [weak self] in
            self?.processResponce($0)
        }
    }
    
    func processResponce(_ responce: OpenWeatherMapResponce?) {
        
    }
}
