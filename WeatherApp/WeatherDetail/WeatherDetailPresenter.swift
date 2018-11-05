//
//  WeatherDetailPresenter.swift
//  WeatherApp
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import Foundation
import UIKit

protocol WeatherDetailPresentation: class {
    var interactor: WeatherDetailInteraction { get }
    var router: WeatherDetailRouting { get }
    func prepareToShowWeatherDetail()
    
}

class WeatherDetailPresenter: WeatherDetailPresentation {
    
    
    
    var interactor: WeatherDetailInteraction
    var router: WeatherDetailRouting
    weak var viewInterface: WeatherDetailViewInterface?
    
    init(interactor: WeatherDetailInteraction,
         router: WeatherDetailRouting) {
        self.interactor = interactor
        self.router = router
    }
    
    private var forecast: Forecast? {
        return interactor.forecast
    }
    
    func prepareToShowWeatherDetail() {
        guard let selectedForecast = forecast else {
            viewInterface?.showNoForecastError()
            return
        }
        viewInterface?.showForecastDetail(forecast: selectedForecast)
    }
    
}
