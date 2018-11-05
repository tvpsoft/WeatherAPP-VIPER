//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import UIKit

protocol WeatherDetailViewInterface: class {
    var presenter: WeatherDetailPresentation? { get set }
    func showNoForecastError()
    func showForecastDetail(forecast: Forecast)
}

class WeatherDetailViewController: UIViewController {
    
    var presenter: WeatherDetailPresentation?
    
    let nameLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 1
        lb.textAlignment = .center
        lb.font = UIFont.boldSystemFont(ofSize: 24)
        return lb
    }()
    
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.prepareToShowWeatherDetail()
    }
    
    // MARK: Setup View Components
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubViewList(nameLabel)
        nameLabel.fillSuperview()
    }
    
}

extension WeatherDetailViewController: WeatherDetailViewInterface {
    
    func showNoForecastError() {
        print("No movie was selected")
    }
    
    func showForecastDetail(forecast: Forecast) {
        nameLabel.text = forecast.weather[0].description
    }
}
