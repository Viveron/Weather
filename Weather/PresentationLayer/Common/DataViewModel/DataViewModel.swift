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
    private let notificationCenter = NotificationCenter.default
    
    private(set) var responce: OpenWeatherMapResponce? = nil
    
    init(storageService: StorageService) {
        self.storageService = storageService
        
        notificationCenter.addObserver(forName: .TimerDemonDidFired, object: nil, queue: .main) { [weak self] _ in self?.processResponce(self?.responce)
        }
    }
    
    // MARK: - ViewOutput
    
    func viewDidLoad() {
        storageService.addObserver { [weak self] in
            self?.responce = $0
            self?.processResponce($0)
        }
    }
    
    func processResponce(_ responce: OpenWeatherMapResponce?) {
        // empty
    }
}
