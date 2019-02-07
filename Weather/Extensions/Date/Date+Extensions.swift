//
//  Date+Extensions.swift
//  Weather
//
//  Created by Victor Shabanov on 07/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

extension Date {
    
    var isToday: Bool {
        return Calendar.autoupdatingCurrent.isDateInToday(self)
    }
    
    var startOfDay: Date {
        return Calendar.autoupdatingCurrent.startOfDay(for: self)
    }
    
    func inSameDayAs(_ date: Date) -> Bool {
        return Calendar.autoupdatingCurrent.isDate(self, inSameDayAs: date)
    }
    
    var isCloseToNow: Bool {
        let closeHour = 2
        let hour = Calendar.autoupdatingCurrent.dateComponents([.hour], from: self, to: Date()).hour
        return abs(hour ?? closeHour) <= closeHour
    }
}
