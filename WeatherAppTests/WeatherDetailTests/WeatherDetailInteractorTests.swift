//
//  WeatherDetailInteractorTests.swift
//  WeatherAppTests
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//


import XCTest
@testable import WeatherApp

class WeatherDetailInteractorTests: XCTestCase {
    
    var subject: WeatherDetailInteractor!
    let fakeForecast = Forecast(dt: 1541329200, temp: Temp(day: 25, min: 25, max: 25, night: 25, eve: 25, morn: 25), pressure: 1000, humidity: 0, weather: [WeatherElement(id: 123, main: .clear, description: "Nice day", icon: "01d")], speed: 2, deg: 100, clouds: 100, rain: 10)
    
    override func setUp() {
        super.setUp()
        let container = WeatherDetailContainer()
        let viewController = container.createModule(for: fakeForecast) as? WeatherDetailViewController
        guard let interactor = viewController?.presenter?.interactor else {
            XCTFail("interactor non existing")
            return
        }
        subject = (interactor as! WeatherDetailInteractor)
    }
    
    func testInteractorReceivesWeatherFromRouter() {
        XCTAssertEqual(subject?.forecast?.pressure, fakeForecast.pressure)
    }
    
    
}
