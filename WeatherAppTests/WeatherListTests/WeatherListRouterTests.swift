//
//  WeatherListRouterTests.swift
//  WeatherAppTests
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherListRouterTests: XCTestCase {
    
    var weatherListRouter: WeatherListRouter!
    
    override func setUp() {
        super.setUp()
        weatherListRouter = WeatherListRouter()
    }
    
    func testRootVCIsWeatherDetailVCWhenPresented() {
        weatherListRouter.presentWeatherDetailView(with: Forecast(dt: 1541329200, temp: Temp(day: 25, min: 25, max: 25, night: 25, eve: 25, morn: 25), pressure: 1000, humidity: 0, weather: [WeatherElement(id: 123, main: .clear, description: "Nice day", icon: "01d")], speed: 2, deg: 100, clouds: 100, rain: 10))
        
        XCTAssertTrue(weatherListRouter.rootNavController?.viewControllers.last is WeatherDetailViewController)
    }
}
