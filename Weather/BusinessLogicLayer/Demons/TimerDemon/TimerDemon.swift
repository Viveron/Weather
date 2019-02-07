//
//  TimerDemon.swift
//  Weather
//
//  Created by Victor Shabanov on 07/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit

final class TimerDemon: Demon {
    
    private let defaults = UserDefaults.standard
    private let notificationCenter = NotificationCenter.default
    
    private var timer: Timer?
    
    private var fireDate: Date? {
        set {
            defaults.set(newValue?.timeIntervalSince1970,
                         forKey: .fireDateKey)
        }
        get {
            let interval = defaults.double(forKey: .fireDateKey)
            return interval > 0 ? Date(timeIntervalSince1970: interval) : nil
        }
    }
    
    // MARK: - Demon
    
    private(set) var isStarted: Bool = false {
        didSet {
            if isStarted {
                subscride()
            } else {
                unsubscride()
            }
        }
    }
    
    deinit {
        stop()
    }
    
    func start() {
        isStarted = true
        
        sheduleTimer()
    }
    
    func stop() {
        fireDate = nil
        isStarted = false
        
        invalidateTimer()
    }
    
    // MARK: - Private methods
    
    private func sheduleTimer() {
        let now = Date().timeIntervalSince1970
        let minutes = TimeInterval(Int(now / 60) % 60)
        let nextHour: TimeInterval = .hour - minutes
        let interval: TimeInterval = nextHour > 0 ? nextHour : .hour

        fireDate = Date(timeIntervalSinceNow: interval)
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { [weak self] _ in
            self?.timerFireAction()
        }
    }
    
    @objc private func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func restoreTimer() {
        if let fireDate = fireDate, fireDate < Date() {
            timerFireAction()
        } else {
            sheduleTimer()
        }
    }
    
    private func timerFireAction() {
        notify(.TimerDemonDidFired)
        sheduleTimer()
    }
    
    private func notify(_ name: Notification.Name) {
        notificationCenter.post(name: name, object: nil)
    }
    
    private func subscride() {
        notificationCenter.addObserver(self,
                                       selector: #selector(invalidateTimer),
                                       name: UIApplication.willResignActiveNotification,
                                       object: nil)
        
        notificationCenter.addObserver(self,
                                       selector: #selector(restoreTimer),
                                       name: UIApplication.didBecomeActiveNotification,
                                       object: nil)
    }
    
    private func unsubscride() {
        notificationCenter.removeObserver(self,
                                          name: UIApplication.willResignActiveNotification,
                                          object: nil)
        
        notificationCenter.removeObserver(self,
                                          name: UIApplication.didBecomeActiveNotification,
                                          object: nil)
    }
}

// MARK: - Constnats

private extension TimeInterval {
    
    static let hour: TimeInterval = 60 * 60
}

private extension String {
    
    static let fireDateKey = "TimerDemonFireDateKey"
}
