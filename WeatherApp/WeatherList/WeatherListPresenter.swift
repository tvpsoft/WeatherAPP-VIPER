//
//  WeatherListPresenter.swift
//  WeatherApp
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import Foundation

// MARK:- Weather List Presentation Protocol
protocol WeatherListPresentation: class {
    var sections: Int { get }
    var forecastCount: Int { get }
    func forecast(at index: Int) -> Forecast?
    func loadWeatherForecasts()
    func selectForecast(_ forecast : Forecast)
}

// MARK:- Presenter -> View Interface
protocol WeatherListViewInterface: class {
    func refreshWeatherList()
    func showLoadingError(errorMessage: String)
}


class WeatherListPresenter: WeatherListPresentation {
    
    // MARK: Init
    private var interactor: WeatherListInteraction
    private let router: WeatherListRouting
    private let weatherService: WeatherService
    
    init(interactor: WeatherListInteraction, router: WeatherListRouting, weatherService: WeatherService = WeatherService.shared) {
        self.interactor = interactor
        self.router = router
        self.weatherService = weatherService
    }
    
    weak var weatherListViewInterface: WeatherListViewInterface?
    
    private(set) var weather: Weather? {
        didSet {
            guard let weather = weather, !weather.forecasts.isEmpty else {
                weatherListViewInterface?.showLoadingError(errorMessage: "No Weather Forecast Loaded")
                return
            }
            weatherListViewInterface?.refreshWeatherList()
        }
    }
    
    var sections: Int {
        return 1
    }
    
    var forecastCount: Int {
        return weather?.forecasts.count ?? 0
    }
    
    func forecast(at index: Int) -> Forecast? {
        return weather?.forecasts[index] ?? nil
    }
    
    func loadWeatherForecasts() {
        interactor.loadWeatherForecasts()
    }
    
    func selectForecast(_ forecast: Forecast) {
        router.presentWeatherDetailView(with: forecast)
    }
    
    
}


extension WeatherListPresenter: WeatherListInteractionOutput {
    func refreshWeatherList(with forecast: Weather) {
        self.weather = forecast
    }
    
    
    func showLoadingMovieListError(_ error: ErrorType) {
        weatherListViewInterface?.showLoadingError(errorMessage: "Some Error occured")
    }
}

