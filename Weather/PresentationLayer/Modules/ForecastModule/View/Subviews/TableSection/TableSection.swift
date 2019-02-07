//
//  TableSection.swift
//  Weather
//
//  Created by Victor Shabanov on 07/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import TableKit

extension TableSection {
    
    convenience init(date: Date, rows: [Row]) {
        self.init(rows: rows)
        
        let view = ForecastSectionHeaderView()
        view.configure(with: date)
        
        self.headerView = view
        self.footerView = nil
        
        self.headerHeight = 50
        self.footerHeight = .leastNonzeroMagnitude
    }
}
