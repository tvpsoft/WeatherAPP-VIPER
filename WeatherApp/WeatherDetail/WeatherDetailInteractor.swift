//
//  WeatherDetailInteractor.swift
//  WeatherApp
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import Foundation

protocol WeatherDetailInteraction: class {
    var forecast: Forecast? { get set }
}

class WeatherDetailInteractor: WeatherDetailInteraction {
    var forecast: Forecast?
}
