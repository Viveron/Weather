//
//  ForecastView.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit
import SnapKit

final class ForecastView: UIView {
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.backgroundColor = .white
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 110, bottom: 0, right: 0)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.allowsSelection = false
        addSubview(tableView)
        
        makeConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Private methods
    
    private func makeConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
