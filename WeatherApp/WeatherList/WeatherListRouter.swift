//
//  WeatherListRouter.swift
//  WeatherApp
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import Foundation

protocol WeatherListRouting: class {
    var container: WeatherDetailContainer { get set }
    func presentWeatherDetailView(with forecast: Forecast)
}

class WeatherListRouter: Router, WeatherListRouting {
    
    var container = WeatherDetailContainer()
    let listContainer = WeatherListContainer()
    
    func presentWeatherDetailView(with forecast: Forecast) {
        let detailVC = container.createModule(for: forecast)
        guard let listViewVC = rootNavController else { return }
        listViewVC.pushViewController(detailVC, animated: true)
    }
    
}
