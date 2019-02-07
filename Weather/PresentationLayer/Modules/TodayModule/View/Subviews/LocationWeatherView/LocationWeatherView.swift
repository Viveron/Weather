//
//  LocationWeatherView.swift
//  Weather
//
//  Created by Victor Shabanov on 07/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit
import SnapKit

final class LocationWeatherView: UIView {
    
    private let stackView = UIStackView()
    
    let iconLabel = UILabel()
    let locationLabel = UILabel()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 2
        addSubview(stackView)
        
        iconLabel.font = UIFont(WeatherIcons.regular, size: 90)
        iconLabel.textAlignment = .center
        iconLabel.textColor = .sunlight
        stackView.addArrangedSubview(iconLabel)
        
        locationLabel.font = UIFont(Roboto.regular, size: .big)
        locationLabel.textAlignment = .center
        locationLabel.textColor = .night
        stackView.addArrangedSubview(locationLabel)
        
        titleLabel.font = UIFont(Roboto.light, size: .large)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .night
        stackView.addArrangedSubview(titleLabel)
        
        makeConstraints()
        
        iconLabel.text = GeneralWeather.sunny.text
        locationLabel.text = String(format: "%@, %@", "London", "UK")
        titleLabel.text = String(format: "%@%@ | %@", "22", String.celsius, "Sunny")
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Private methods
    
    private func makeConstraints() {
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.centerX.equalToSuperview()
        }
    }
}
