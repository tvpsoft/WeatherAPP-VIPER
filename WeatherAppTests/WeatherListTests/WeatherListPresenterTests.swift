//
//  WeatherListPresenterTests.swift
//  WeatherAppTests
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherListPresenterTests: XCTestCase {
    
    class MockInteractor: WeatherListInteractor {
        override func loadWeatherForecasts() {
            
        }
    }
    
    class MockRouter: WeatherListRouting {
    
        var container: WeatherDetailContainer = WeatherDetailContainer()
        var forecast: Forecast?
        
        func presentWeatherDetailView(with forecast: Forecast) {
            self.forecast = forecast
        }
        
    }
    
    class MockInterface: WeatherListViewInterface {
        var shouldLoadMovieListWithMovies = false
        var shouldShowError = false
        
        func refreshWeatherList() {
            shouldLoadMovieListWithMovies = true
        }
        
        func showLoadingError(errorMessage: String) {
            shouldShowError = true
        }
    }
    
    var presenter: WeatherListPresenter?
    let mockInteractor = MockInteractor()
    let mockRouter = MockRouter()
    
    let fakeWeather = Weather(city: City(id: 1, name: "Paris", coord: Coord(lon: 2, lat: 2), country: "fr", population: 100000), cod: "16n", message: 123, cnt: 16, forecasts: [
            Forecast(dt: 1541329200, temp: Temp(day: 25, min: 25, max: 25, night: 25, eve: 25, morn: 25), pressure: 1000, humidity: 0, weather: [WeatherElement(id: 123, main: .clear, description: "Nice day", icon: "01d")], speed: 2, deg: 100, clouds: 100, rain: 10) ,
            Forecast(dt: 1541329200, temp: Temp(day: 15, min: 15, max: 15, night: 15, eve: 15, morn: 15), pressure: 1200, humidity: 0, weather: [WeatherElement(id: 123, main: .clouds, description: "Cloudy day", icon: "02d")], speed: 2, deg: 100, clouds: 100, rain: 10) ,
            Forecast(dt: 1541329200, temp: Temp(day: 8, min: 8, max: 8, night: 8, eve: 8, morn: 8), pressure: 1300, humidity: 0, weather: [WeatherElement(id: 123, main: .rain, description: "Rain day", icon: "03d")], speed: 2, deg: 100, clouds: 100, rain: 10)
        ])
        
    
    
    var mockInterface: MockInterface?
    
    override func setUp() {
        super.setUp()
        presenter = WeatherListPresenter(interactor: mockInteractor, router: mockRouter)
        mockInterface = MockInterface()
        presenter?.weatherListViewInterface = mockInterface
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testWeatherSectionIs1() {
        presenter?.refreshWeatherList(with: fakeWeather)
        XCTAssertEqual(presenter?.sections, 1)
    }
    
    func testWeatherCountIs3() {
        presenter?.refreshWeatherList(with: fakeWeather)
        XCTAssertEqual(presenter?.forecastCount, 3)
    }
    
    func testItemAtIndexIsInjectedForecast() {
        presenter?.refreshWeatherList(with: fakeWeather)
        let forecast = presenter?.forecast(at: 0)
        XCTAssertEqual(forecast?.weather[0].description, "Nice day")
        XCTAssertEqual(forecast?.pressure, 1000)
    }
    
    
    func testWeatherListEmptyShouldShowList() {
        presenter?.refreshWeatherList(with: fakeWeather)
        XCTAssertEqual(mockInterface?.shouldShowError,
                       false)
        XCTAssertEqual(mockInterface?.shouldLoadMovieListWithMovies,
                       true)
    }
    
    func testSelectedMovie() {
        presenter?.refreshWeatherList(with: fakeWeather)
        presenter?.selectForecast(fakeWeather.forecasts[1])
        XCTAssertEqual(mockRouter.forecast?.pressure, fakeWeather.forecasts[1].pressure)
    }
    
}
