//
//  WeatherDetailContainer.swift
//  WeatherApp
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import UIKit

class WeatherDetailContainer {
    lazy var interactor = WeatherDetailInteractor()
    lazy var router = WeatherDetailRouter()
    lazy var presenter = WeatherDetailPresenter(interactor: interactor, router: router)
    
    func createModule(for forecast: Forecast) -> UIViewController {
        let view = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(withIdentifier: "WeatherDetailViewController") as! WeatherDetailViewController
        view.presenter = presenter
        interactor.forecast = forecast
        presenter.viewInterface = view
        return view
    }
}

