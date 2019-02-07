//
//  ForecastTableViewCell.swift
//  Weather
//
//  Created by Victor Shabanov on 07/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit
import SnapKit
import TableKit

final class ForecastTableViewCell: UITableViewCell {
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    let iconLabel = UILabel()
    let timeLabel = UILabel()
    let descLabel = UILabel()
    let tempLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        iconLabel.font = UIFont(WeatherIcons.regular, size: 50)
        iconLabel.textAlignment = .center
        iconLabel.textColor = .sunlight
        contentView.addSubview(iconLabel)
        
        timeLabel.font = UIFont(Roboto.medium, size: .big)
        timeLabel.textColor = .night
        contentView.addSubview(timeLabel)
        
        descLabel.font = UIFont(Roboto.light, size: .big)
        descLabel.textColor = .night
        contentView.addSubview(descLabel)
        
        tempLabel.font = UIFont(Roboto.thin, size: 40)
        tempLabel.textColor = .night
        tempLabel.textAlignment = .right
        contentView.addSubview(tempLabel)
        
        makeConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        iconLabel.text = nil
        timeLabel.text = nil
        descLabel.text = nil
        tempLabel.text = nil
        
        backgroundColor = .white
    }
    
    // MARK: - Private methods
    
    private func makeConstraints() {
        
        iconLabel.snp.makeConstraints { make in
            make.width.equalTo(110)
            make.top.left.height.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.centerY)
            make.left.equalTo(iconLabel.snp.right)
            make.right.equalTo(tempLabel.snp.left)
        }
        
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.centerY)
            make.left.equalTo(iconLabel.snp.right)
            make.right.equalTo(tempLabel.snp.left)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.top.height.equalToSuperview()
            make.right.equalToSuperview().inset(25)
            make.width.equalTo(contentView.snp.height).multipliedBy(1.2)
        }
    }
}

// MARK: - ConfigurableCell
extension ForecastTableViewCell: ConfigurableCell {
    
    static let defaultHeight: CGFloat? = 100
    
    func configure(with item: ForecastTableViewCellItem) {
        iconLabel.text = item.weatherIcon.text
        timeLabel.text = ForecastTableViewCell.dateFormatter.string(from: item.date)
        descLabel.text = item.description
        tempLabel.text = "\(lroundf(item.temp))" + .degrees
        
        backgroundColor = item.isActual ? UIColor.sunlight.withAlphaComponent(0.05) : .white
    }
}
