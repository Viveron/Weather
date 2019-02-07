//
//  ForecastViewController.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit
import TableKit

final class ForecastViewController: ViewController<ForecastViewOutput, ForecastView> {
    
    private lazy var tableDirector = TableDirector(tableView: customView.tableView)
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableDirector.reload()
    }
    
    // MARK: - Private methods
    
}

// MARK: - ForecastViewInput
extension ForecastViewController: ForecastViewInput {
    
    func configure(title: String?) {
        navigationItem.title = title ?? HomeTabBarItem.forecast.title
    }
    
    func configure(items: [ForecastSectionItem]) {
        let sections = items.map { item -> TableSection in
            let rows = item.cellItems.map {
                TableRow<ForecastTableViewCell>(item: $0)
            }
            
            return TableSection(date: item.date, rows: rows)
        }
        
        tableDirector.clear().append(sections: sections).reload()
    }
}
