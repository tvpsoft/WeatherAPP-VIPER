//
//  WeatherDetailRouter.swift
//  WeatherApp
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import Foundation

protocol WeatherDetailRouting: class {
}

class WeatherDetailRouter: WeatherDetailRouting {
    private let container: WeatherDetailContainer
    init(container: WeatherDetailContainer = WeatherDetailContainer()) {
        self.container = container
    }
}
