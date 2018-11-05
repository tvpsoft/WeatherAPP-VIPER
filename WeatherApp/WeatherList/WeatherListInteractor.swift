//
//  WeatherListInteractor.swift
//  WeatherApp
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import Foundation

// MARK:- Interaction Protocol
protocol WeatherListInteraction {
    func loadWeatherForecasts()
}

// MARK:- Interaction -> Presenter Protocol
protocol WeatherListInteractionOutput: class {
    var weather : Weather? { get }
    func refreshWeatherList(with forecast: Weather)
//    func showLoadingWeatherListError(_ error: ErrorType)
}

// MARK:- Interactor
class WeatherListInteractor: WeatherListInteraction {
    
    var weather : Weather?
    weak var output: WeatherListInteractionOutput?
    
    /// Init
    private let weatherService: WeatherService
    
    init(service: WeatherService = WeatherService.shared) {
        self.weatherService = service
    }
    
    func loadWeatherForecasts() {
        weatherService.getForcasts { (responeWeather) in
            self.weather = responeWeather
            self.output?.refreshWeatherList(with: responeWeather)
        }
    }
    
    
}
