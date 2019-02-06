//
//  Error.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

extension Error {
    
    var isNotConnectedToInternet: Bool {
        if let error = self as? URLError {
            return error.code == .notConnectedToInternet || error.code == .networkConnectionLost
        }
        return false
    }
    
    var isRequestTimeout: Bool {
        if let error = self as? URLError {
            return error.code == .timedOut
        }
        return false
    }
}

func isConnection(error: Error?) -> Bool {
    guard let error = error else {
        return false
    }
    
    return error.isNotConnectedToInternet
        || error.isRequestTimeout
}
