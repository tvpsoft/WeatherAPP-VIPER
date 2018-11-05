//
//  WeatherListInteractorTests.swift
//  WeatherAppTests
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherListInteractorTests: XCTestCase {
    
    class FakeInteractionOutput: WeatherListInteractionOutput {
        
        var weather: Weather?
        var error: ErrorType?
        
        func refreshWeatherList(with forecast: Weather) {
            self.weather = forecast
        }
        
        func showLoadingWeatherListError(_ error: ErrorType) {
            self.error = error
        }
    }
    
    class FakeService: WeatherService {
        
        var result : ResultCallback<Weather>?
        
        override func getForcasts(completion: @escaping (ResultCallback<Weather>) -> Void) {
            
            guard let result = result else {
                XCTFail("Didnot supply fake result in Fake MovieList Client")
                return
            }
            completion(result)
        }
        
    }
    
    struct StubWeatherListResult {
        static let errorResult: ResultCallback<Weather> = ResultCallback.failure(.noInternet)
        static let successfulResult: ResultCallback<Weather> = ResultCallback.success(StubWeatherListResult.fakeWeather)
        static let fakeWeather = Weather(city: City(id: 1, name: "Paris", coord: Coord(lon: 2, lat: 2), country: "fr", population: 100000), cod: "16n", message: 123, cnt: 16, forecasts: [
            Forecast(dt: 1541329200, temp: Temp(day: 25, min: 25, max: 25, night: 25, eve: 25, morn: 25), pressure: 1000, humidity: 0, weather: [WeatherElement(id: 123, main: .clear, description: "Nice day", icon: "01d")], speed: 2, deg: 100, clouds: 100, rain: 10) ,
            Forecast(dt: 1541329200, temp: Temp(day: 15, min: 15, max: 15, night: 15, eve: 15, morn: 15), pressure: 1200, humidity: 0, weather: [WeatherElement(id: 123, main: .clouds, description: "Cloudy day", icon: "02d")], speed: 2, deg: 100, clouds: 100, rain: 10) ,
            Forecast(dt: 1541329200, temp: Temp(day: 8, min: 8, max: 8, night: 8, eve: 8, morn: 8), pressure: 1300, humidity: 0, weather: [WeatherElement(id: 123, main: .rain, description: "Rain day", icon: "03d")], speed: 2, deg: 100, clouds: 100, rain: 10)
            ])
        
    }
    
    var subject: WeatherListInteractor!
    let fakeWeatherService = FakeService()
    let weatherListInteractorOutput = FakeInteractionOutput()
    
    override func setUp() {
        super.setUp()
        subject = WeatherListInteractor(service: fakeWeatherService)
        subject.output = weatherListInteractorOutput
    }
    
    func test_LoadWeatherWithSuccess_ReturnsWeather() {
        loadWeatherListWithSuccess()
        // Returned movies are caught correctly in the subject under test
        guard let weather = subject.weather else {
            XCTFail("Nil data Returned")
            return
        }
        XCTAssertEqual(weather, StubWeatherListResult.fakeWeather)
    }
    
    func test_LoadWeatherWithSuccess_WeatherAreCaughtInSubjectOutputProtocol() {
        loadWeatherListWithSuccess()
        // Catch Weather in Output Protocol
        guard let weatherCaughtInInteractionOutputProtocol = weatherListInteractorOutput.weather else {
            XCTFail("Output has caught no weather")
            return
        }
        switch StubWeatherListResult.successfulResult {
        case .success(let weather):
            XCTAssertEqual(weather, weatherCaughtInInteractionOutputProtocol)
        default:
            XCTFail("should be case success instead failure")
        }
    }
    
    func test_LoadWeatherWithError_ErrorCaughtInOutput() {
        loadWeatherListInSubjectWithError()
        // Catch Error in Output Protocol
        switch StubWeatherListResult.errorResult {
        case .failure(let errorType):
            XCTAssertEqual(weatherListInteractorOutput.error, errorType)
        default:
            XCTFail("should be case failure instead success")
        }
    }
    
    // Helpers
    private func loadWeatherListWithSuccess() {
        fakeWeatherService.result = StubWeatherListResult.successfulResult
        subject.loadWeatherForecasts()
    }
    
    private func loadWeatherListInSubjectWithError() {
        let feedErrorResult = StubWeatherListResult.errorResult
        fakeWeatherService.result = feedErrorResult
        subject.loadWeatherForecasts()
    }
}
