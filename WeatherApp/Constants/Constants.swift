//
//  Constants.swift
//  WeatherApp
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import Foundation

struct APIBuilder {
    static let ApiRoot = "https://api.openweathermap.org/data/2.5/"
    static let ApiKey = "648a3aac37935e5b45e09727df728ac2"
    static let ApiForcastParis16 = APIBuilder.ApiRoot + "forecast/daily?q=Paris&mode=json&units=metric&cnt=16&APPID=" + APIBuilder.ApiKey
    static let ApiImageURL = "https://openweathermap.org/img/w/"
}
