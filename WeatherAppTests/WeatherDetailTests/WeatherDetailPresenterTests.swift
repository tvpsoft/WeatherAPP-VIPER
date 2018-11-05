//
//  WeatherDetailPresenterTests.swift
//  WeatherAppTests
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import XCTest
@testable import WeatherApp


class WeatherDetailPresenterTests: XCTestCase {
    
    var weatherDetailPresenter: WeatherDetailPresenter!
    
    class MockInteractor: WeatherDetailInteraction {
        var forecast: Forecast?
    }
    
    class MockRouter: WeatherDetailRouting {
        
    }
    
    class MockInterface: WeatherDetailViewInterface {
        
        var presenter: WeatherDetailPresentation?
        
        var shouldShowNoWeatherError = false
        var shouldShowWeatherDetail = false
        
        func showNoForecastError() {
            shouldShowNoWeatherError = true
        }
        
        func showForecastDetail(forecast: Forecast) {
            shouldShowWeatherDetail = true
        }
        
    }
    
    var mockInteractor: MockInteractor!
    var mockRouter: MockRouter!
    var mockInterface: MockInterface!
    
    override func setUp() {
        super.setUp()
        mockInteractor = MockInteractor()
        mockRouter = MockRouter()
        mockInterface = MockInterface()
        weatherDetailPresenter = WeatherDetailPresenter(interactor: mockInteractor, router: mockRouter)
        weatherDetailPresenter.viewInterface = mockInterface
    }
    
    override func tearDown() {
        mockInterface = MockInterface()
        super.tearDown()
    }
    
    func testViewInterfaceShowErrorWhenNoForecast() {
        mockInteractor.forecast = nil
        weatherDetailPresenter.prepareToShowWeatherDetail()
        XCTAssertEqual(mockInterface.shouldShowNoWeatherError, true)
        XCTAssertEqual(mockInterface.shouldShowWeatherDetail, false)
    }
    
    func testViewInterfaceShowWeatherWhenSuccess() {
        mockInteractor.forecast = Forecast(dt: 1541329200, temp: Temp(day: 25, min: 25, max: 25, night: 25, eve: 25, morn: 25), pressure: 1000, humidity: 0, weather: [WeatherElement(id: 123, main: .clear, description: "Nice day", icon: "01d")], speed: 2, deg: 100, clouds: 100, rain: 10)
        
        weatherDetailPresenter.prepareToShowWeatherDetail()
        XCTAssertEqual(mockInterface.shouldShowNoWeatherError, false)
        XCTAssertEqual(mockInterface.shouldShowWeatherDetail, true)
    }
    
    
}

