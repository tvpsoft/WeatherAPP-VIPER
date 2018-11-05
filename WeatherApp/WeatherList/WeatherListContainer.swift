//
//  WeatherListContainer.swift
//  WeatherApp
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import UIKit

class WeatherListContainer {
    lazy var interactor = WeatherListInteractor()
    lazy var router = WeatherListRouter()
    lazy var presenter = WeatherListPresenter(interactor: interactor, router: router)
    
    func makeWeatherListViewController() -> WeatherListViewController {
        let m = WeatherListViewController(collectionViewLayout: UICollectionViewFlowLayout())
        m.presenter = presenter
        // Dependency Inversion
        presenter.weatherListViewInterface = m
        interactor.output = presenter
        return m
    }
}
