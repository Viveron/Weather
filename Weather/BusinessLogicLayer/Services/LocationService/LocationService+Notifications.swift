//
//  LocationService+Notifications.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

extension Notification.Name {
    
    // Status changing noticiations
    static let LocationServiceDidAuthorized = Notification.Name(rawValue: "LocationServiceNotificationDidAuthorized")
    static let LocationServiceDidDenied     = Notification.Name(rawValue: "LocationServiceNotificationDenied")
    static let LocationServiceDidFail       = Notification.Name(rawValue: "LocationServiceDidFail")
    
    // Location updation noticiation
    static let LocationServiceDidUpdate     = Notification.Name(rawValue: "LocationServiceDidUpdate")
}
