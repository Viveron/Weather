//
//  StorageService.swift
//  Weather
//
//  Created by Victor Shabanov on 07/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

final class StorageService {
    
    private let lock = NSLock()
    private let queue = DispatchQueue.main
    private let defaults = UserDefaults.standard
    
    private var observers: [StorageServiceObserver] = []
    
    private var _responce: OpenWeatherMapResponce? {
        set {
            let data = try? JSONEncoder().encode(newValue)
            defaults.set(data, forKey: .responceKey)
        }
        get {
            if let data = defaults.data(forKey: .responceKey) {
                return try? JSONDecoder().decode(OpenWeatherMapResponce.self, from: data)
            }
            return nil
        }
    }
    
    private var responce: OpenWeatherMapResponce? {
        willSet {
            _responce = newValue
        }
    }
    
    init() {
        // initial read stored value
        responce = _responce
    }
    
    @discardableResult
    func addObserver(_ closure: @escaping ValueBlock<OpenWeatherMapResponce?>) -> StorageServiceObserver {
        let observer = StorageServiceObserver(closure)
        performAndWait {
            self.observers.append(observer)
        }
        
        observer.update(responce)
        return observer
    }
    
    func removeObserver(_ observer: StorageServiceObserver) {
        performAndWait {
            if let index = self.observers.index(of: observer) {
                self.observers.remove(at: index)
            }
        }
    }
    
    func update(with responce: OpenWeatherMapResponce?) {
        self.responce = responce
        notifyObservers(responce)
    }
    
    // MARK: - Private methods
    
    private func notifyObservers(_ responce: OpenWeatherMapResponce?) {
        for observer in observers {
            queue.async {
                observer.update(responce)
            }
        }
    }
    
    // MARK: - Synchronization helpers
    
    private func performAndWait(_ closure: @escaping VoidBlock) {
        lock.lock()
        defer {
            lock.unlock()
        }
        
        closure()
    }
}

// MARK: - Constnats
private extension String {
    
    static let responceKey = "responceKey"
}
