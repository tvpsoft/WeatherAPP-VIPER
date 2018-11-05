//
//  WeatherEntityTests.swift
//  WeatherAppTests
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherEntityTests: XCTestCase {
    
    func testWeatherSetGet() {
        let weatherElement = WeatherElement(id: 123, main: .clear, description: "Nice day", icon: "01d")
        XCTAssertEqual(weatherElement.main.rawValue, "Clear")
        XCTAssertEqual(weatherElement.description, "Nice day")
        XCTAssertEqual(weatherElement.icon, "01d")
        
        let tmp = Temp(day: 20, min: 10, max: 20, night: 15, eve: 15, morn: 10)
        
        XCTAssertEqual(tmp.min, 10)
        XCTAssertEqual(tmp.max, 20)
        XCTAssertEqual(tmp.day, 20)
        XCTAssertEqual(tmp.night, 15)
        
        let forecast = Forecast(dt: 1541329200, temp: tmp, pressure: 1000, humidity: 0, weather: [weatherElement], speed: 2, deg: 100, clouds: 100, rain: 10)
        
        XCTAssertEqual(forecast.pressure, 1000)
        XCTAssertEqual(forecast.humidity, 0)
        XCTAssertEqual(forecast.speed, 2)
        XCTAssertEqual(forecast.clouds, 100)
        
    
    }
}
