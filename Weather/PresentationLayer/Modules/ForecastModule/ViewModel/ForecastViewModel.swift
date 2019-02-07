//
//  ForecastViewModel.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

final class ForecastViewModel: DataViewModel, ForecastViewOutput {
    
    // MARK: - Module components
    
    weak var input: ForecastViewInput?
    
    override func processResponce(_ responce: OpenWeatherMapResponce?) {
        super.processResponce(responce)
        
        var dic: [Date: [OpenWeatherMapResponce.Forecast]] = [:]
        
        responce?.list.forEach {
            let key = Date(timeIntervalSince1970: $0.timestamp).startOfDay
            if let values = dic[key] {
                dic[key] = values + [$0]
            } else {
                dic[key] = [$0]
            }
        }
        
        var find: Bool = false
        let items = dic
            .sorted { (lhv, rhv) -> Bool in
                return lhv.key < rhv.key
            }
            .enumerated()
            .map { (_, element) -> ForecastSectionItem in
                let cellItems = element.value
                    .sorted { (lhv, rhv) -> Bool in
                        return lhv.date < rhv.date
                    }
                    .map { forecast -> ForecastTableViewCellItem in
                        var cellItem = ForecastTableViewCellItem(forecast: forecast)
                        if !find, cellItem.date.isCloseToNow {
                            cellItem.isActual = true
                            find = true
                        }
                        
                        return cellItem
                    }
                
                return ForecastSectionItem(date: element.key, cellItems: cellItems)
            }
        
        input?.configure(items: items)
        input?.configure(title: responce?.city.name)
    }
}
