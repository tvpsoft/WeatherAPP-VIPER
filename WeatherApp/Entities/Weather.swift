//
//  Weather.swift
//  WeatherApp
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import Foundation
import Alamofire

struct Weather: Codable, Equatable {
    let city: City
    let cod: String
    let message: Double
    let cnt: Int
    let forecasts: [Forecast]
    
    private enum CodingKeys : String, CodingKey {
        case city, cod, message, cnt, forecasts = "list"
    }
}


struct City: Codable, Equatable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population: Int
}

struct Coord: Codable, Equatable {
    let lon, lat: Double
}

struct Forecast: Codable, Equatable {
    let dt: Int
    let temp: Temp
    let pressure: Double
    let humidity: Int
    let weather: [WeatherElement]
    let speed: Double
    let deg, clouds: Int
    let rain: Double?
    
    func commentOnTempo() -> String{
        if(self.temp.max > 25){
            return "il fait chaud"
        }
        if(self.temp.min < 10){
            return "il fait froid"
        }
        return ""
    }
}

struct Temp: Codable, Equatable {
    let day, min, max, night: Double
    let eve, morn: Double
}

struct WeatherElement: Codable, Equatable {
    let id: Int
    let main: Main
    let description, icon: String
}

enum Main: String, Codable, Equatable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

// MARK: Convenience initializers and mutators

extension Weather {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Weather.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        city: City? = nil,
        cod: String? = nil,
        message: Double? = nil,
        cnt: Int? = nil,
        forecasts: [Forecast]? = nil
        ) -> Weather {
        return Weather(
            city: city ?? self.city,
            cod: cod ?? self.cod,
            message: message ?? self.message,
            cnt: cnt ?? self.cnt,
            forecasts: forecasts ?? self.forecasts
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension City {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(City.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        id: Int? = nil,
        name: String? = nil,
        coord: Coord? = nil,
        country: String? = nil,
        population: Int? = nil
        ) -> City {
        return City(
            id: id ?? self.id,
            name: name ?? self.name,
            coord: coord ?? self.coord,
            country: country ?? self.country,
            population: population ?? self.population
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Coord {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Coord.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        lon: Double? = nil,
        lat: Double? = nil
        ) -> Coord {
        return Coord(
            lon: lon ?? self.lon,
            lat: lat ?? self.lat
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Forecast {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Forecast.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        dt: Int? = nil,
        temp: Temp? = nil,
        pressure: Double? = nil,
        humidity: Int? = nil,
        weather: [WeatherElement]? = nil,
        speed: Double? = nil,
        deg: Int? = nil,
        clouds: Int? = nil,
        rain: Double?? = nil
        ) -> Forecast {
        return Forecast(
            dt: dt ?? self.dt,
            temp: temp ?? self.temp,
            pressure: pressure ?? self.pressure,
            humidity: humidity ?? self.humidity,
            weather: weather ?? self.weather,
            speed: speed ?? self.speed,
            deg: deg ?? self.deg,
            clouds: clouds ?? self.clouds,
            rain: rain ?? self.rain
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Temp {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Temp.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        day: Double? = nil,
        min: Double? = nil,
        max: Double? = nil,
        night: Double? = nil,
        eve: Double? = nil,
        morn: Double? = nil
        ) -> Temp {
        return Temp(
            day: day ?? self.day,
            min: min ?? self.min,
            max: max ?? self.max,
            night: night ?? self.night,
            eve: eve ?? self.eve,
            morn: morn ?? self.morn
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension WeatherElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WeatherElement.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        id: Int? = nil,
        main: Main? = nil,
        description: String? = nil,
        icon: String? = nil
        ) -> WeatherElement {
        return WeatherElement(
            id: id ?? self.id,
            main: main ?? self.main,
            description: description ?? self.description,
            icon: icon ?? self.icon
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Alamofire response handlers

// To parse the JSON, add this file to your project and do:
//
//   let weather = try Weather(json)
//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseWeather { response in
//     if let weather = response.result.value {
//       ...
//     }
//   }

extension DataRequest {
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }
            
            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }
            
            return Result { try newJSONDecoder().decode(T.self, from: data) }
        }
    }
    
    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseWeather(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Weather>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
