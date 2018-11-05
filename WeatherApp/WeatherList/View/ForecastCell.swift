//
//  ForecastCell.swift
//  WeatherApp
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import UIKit
import DateToolsSwift
import AlamofireImage

class ForecastCell: BaseUICollectionViewCell {
    
    static let cellName = "ForecastCell"
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.textColor = .black
        lb.font = UIFont.boldSystemFont(ofSize: 13)
        return lb
    }()
    
    lazy var iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let minLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.textColor = .darkGray
        lb.font = UIFont.systemFont(ofSize: 12)
        return lb
    }()
    
    let maxLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 12)
        return lb
    }()
    
    
    private var forecast: Forecast?
    
    override func setupViews() {
        super.setupViews()
        
        configCellLayer()
        addSubViewList(titleLabel, iconImageView, maxLabel, minLabel)
        
        titleLabel.anchorWithConstantsToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0)
        
        _ = iconImageView.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: (self.frame.width - 35) / 2, widthConstant: 35, heightConstant: 35)
        
        _ = maxLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 50, widthConstant: 30, heightConstant: 25)
        
        _ = minLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 30, heightConstant: 25)
    }
    
    func configCell(_ forecast: Forecast?) {
        self.forecast = forecast
        titleLabel.text = Date(timeIntervalSince1970: TimeInterval((forecast?.dt)!)).format(with: "EEEE (dd MMM)")
        
        minLabel.text = "\(lround((forecast?.temp.min)!))"
        maxLabel.text = "\(lround((forecast?.temp.max)!))"
        
        let strUrl =  APIBuilder.ApiImageURL + (forecast?.weather[0].icon)! + ".png"
        print(strUrl)
        iconImageView.af_setImage(withURL: URL(string: strUrl)!)
    
    }
    

    private func configCellLayer() {
        layer.cornerRadius = 6
        layer.masksToBounds = true
    }
    
}
