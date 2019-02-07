//
//  ParametersPlateView.swift
//  Weather
//
//  Created by Victor Shabanov on 07/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit
import SnapKit

final class ParametersPlateView: UIView {
    
    private let topBorderLayer = CALayer()
    private let bottomBorderLayer = CALayer()
    
    private let vStackView = UIStackView()
    private let hTopStackView = UIStackView()
    private let hBottomStackView = UIStackView()
    
    let humidityView = WeatherParameterView()
    let rainView = WeatherParameterView()
    let pressureView = WeatherParameterView()
    let windSpeedView = WeatherParameterView()
    let degSpeedView = WeatherParameterView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let borderColor = UIColor.night.withAlphaComponent(0.2).cgColor
        
        topBorderLayer.backgroundColor = borderColor
        layer.addSublayer(topBorderLayer)
        
        bottomBorderLayer.backgroundColor = borderColor
        layer.addSublayer(bottomBorderLayer)
        
        humidityView.iconLabel.text = GeneralWeather.cloudiness.text
        rainView.iconLabel.text = GeneralWeather.rainVolume.text
        
        pressureView.iconLabel.text = GeneralWeather.celsius.text
        pressureView.iconLabel.font = UIFont(WeatherIcons.regular, size: .extra)
        
        windSpeedView.iconLabel.text = GeneralWeather.cloudiness.text
        degSpeedView.iconLabel.text = GeneralWeather.direction.text
        
        hTopStackView.alignment = .center
        hTopStackView.axis = .horizontal
        hTopStackView.distribution = .equalSpacing
        hTopStackView.spacing = 20
        hTopStackView.addArrangedSubview(humidityView)
        hTopStackView.addArrangedSubview(rainView)
        hTopStackView.addArrangedSubview(pressureView)
        
        hBottomStackView.alignment = .fill
        hBottomStackView.axis = .horizontal
        hBottomStackView.distribution = .equalSpacing
        hBottomStackView.spacing = 20
        hBottomStackView.addArrangedSubview(windSpeedView)
        hBottomStackView.addArrangedSubview(degSpeedView)
        
        vStackView.alignment = .center
        vStackView.axis = .vertical
        vStackView.distribution = .equalSpacing
        vStackView.spacing = 10
        vStackView.addArrangedSubview(hTopStackView)
        vStackView.addArrangedSubview(hBottomStackView)
        addSubview(vStackView)
        
        makeConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let borderSize = CGSize(width: 140, height: 1)
        
        let topOrigin = CGPoint(x: (bounds.width - borderSize.width) / 2, y: 0)
        topBorderLayer.frame = CGRect(origin: topOrigin, size: borderSize)
        
        let bottomOrigin = CGPoint(x: topOrigin.x, y: bounds.size.height - borderSize.height)
        bottomBorderLayer.frame = CGRect(origin: bottomOrigin, size: borderSize)
    }
    
    // MARK: - Private methods
    
    private func makeConstraints() {
        
        let arrangedSubviews = [
            humidityView,
            rainView,
            pressureView,
            windSpeedView,
            degSpeedView
        ]
        
        arrangedSubviews.forEach {
            $0.snp.makeConstraints { make in
                make.size.equalTo(WeatherParameterView.prefferedSize)
            }
        }
        
        vStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

// MARK: - Configuration
extension ParametersPlateView {
    
    func configure(forecast: OpenWeatherMapResponce.Forecast?) {
        guard let forecast = forecast  else {
            humidityView.titleLabel.text = nil
            rainView.titleLabel.text = nil
            pressureView.titleLabel.text = nil
            windSpeedView.titleLabel.text = nil
            degSpeedView.titleLabel.text = nil
            return
        }
        
        humidityView.titleLabel.text = "\(lroundf(forecast.main.humidity))" + .persent
        rainView.titleLabel.text = "\(lroundf(forecast.rain?.value ?? 0)) " + .mm
        pressureView.titleLabel.text = "\(lroundf(forecast.main.pressure)) " + .hPa
        windSpeedView.titleLabel.text = "\(lroundf(forecast.wind.speed)) " + .kmInH
        degSpeedView.titleLabel.text = "\(lroundf(forecast.wind.deg))" + .degrees
    }
}
