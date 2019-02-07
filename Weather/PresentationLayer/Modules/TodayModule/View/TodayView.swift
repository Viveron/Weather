//
//  TodayView.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit
import SnapKit

final class TodayView: UIView {
    
    private let stackView = UIStackView()
    
    let locationView = LocationWeatherView()
    let plateView = ParametersPlateView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 50
        stackView.addArrangedSubview(locationView)
        stackView.addArrangedSubview(plateView)
        addSubview(stackView)
        
        makeConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Private methods
    
    private func makeConstraints() {
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        locationView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(200)
        }
        
        plateView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(160)
        }
    }
}
