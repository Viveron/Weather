//
//  ForecastSectionHeaderView.swift
//  Weather
//
//  Created by Victor Shabanov on 07/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit
import SnapKit

final class ForecastSectionHeaderView: UIView {
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }()
    
    private let backgroundView = UIView()
    
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        backgroundView.backgroundColor = UIColor.night.withAlphaComponent(0.05)
        addSubview(backgroundView)
        
        titleLabel.font = UIFont(Roboto.light, size: .big)
        titleLabel.textColor = .night
        addSubview(titleLabel)
        
        makeConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Private methods
    
    private func makeConstraints() {
        autoresizingMask = [.flexibleWidth]
        
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.centerY.equalToSuperview()
        }
    }
}

// MARK: - Configuration
extension ForecastSectionHeaderView {
    
    func configure(with date: Date) {
        let text = date.isToday ? "Today" : ForecastSectionHeaderView.dateFormatter.string(from: date)
        titleLabel.text = text.uppercased()
    }
}
