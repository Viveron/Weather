//
//  WeatherParameterView.swift
//  Weather
//
//  Created by Victor Shabanov on 07/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit
import SnapKit

extension WeatherParameterView {
    
    static let prefferedSize = CGSize(width: 80, height: 50)
}

final class WeatherParameterView: UIView {
    
    let iconLabel = UILabel()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        iconLabel.font = UIFont(WeatherIcons.regular, size: .large)
        iconLabel.textAlignment = .center
        iconLabel.textColor = .sunlight
        addSubview(iconLabel)
        
        titleLabel.font = UIFont(Roboto.regular, size: .normal)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .night
        addSubview(titleLabel)
        
        makeConstraints()
        
        titleLabel.text = "57%"
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Private methods
    
    private func makeConstraints() {
        
        iconLabel.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.top.centerX.equalToSuperview()
        }
        
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconLabel.snp.bottom).inset(5)
            make.bottom.left.right.equalToSuperview()
        }
    }
}
