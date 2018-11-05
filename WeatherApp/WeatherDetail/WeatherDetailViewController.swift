//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import UIKit
import AlamofireImage

protocol WeatherDetailViewInterface: class {
    var presenter: WeatherDetailPresentation? { get set }
    func showNoForecastError()
    func showForecastDetail(forecast: Forecast)
}

class WeatherDetailViewController: UIViewController {
    
    var presenter: WeatherDetailPresentation?
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var mainDescLabel: UILabel!
    
    @IBOutlet weak var tempoLabel: UILabel!
    
    @IBOutlet weak var presureValueLabel: UILabel!
    
    @IBOutlet weak var humidityValueLabel: UILabel!
    
    @IBOutlet weak var windSpeedValueLabel: UILabel!
    
    @IBOutlet weak var windDirectionLabel: UILabel!
    
    @IBOutlet weak var tempoMorningLabel: UILabel!
    
    @IBOutlet weak var tempoDayLabel: UILabel!
    
    @IBOutlet weak var tempoEveningLabel: UILabel!
    
    @IBOutlet weak var tempoNightLabel: UILabel!
    
    @IBOutlet weak var ilFaitLabel: UILabel!
    
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.prepareToShowWeatherDetail()
    }
    
    // MARK: Setup View Components
    private func setupViews() {
        view.backgroundColor = .white
    }
    
}

extension WeatherDetailViewController: WeatherDetailViewInterface {
    
    func showNoForecastError() {
        print("No movie was selected")
    }
    
    func showForecastDetail(forecast: Forecast) {
        let strUrl =  APIBuilder.ApiImageURL + (forecast.weather[0].icon) + ".png"
        print(strUrl)
        iconImageView.af_setImage(withURL: URL(string: strUrl)!)
        mainLabel.text = forecast.weather[0].main.rawValue
        mainDescLabel.text = forecast.weather[0].description
        tempoLabel.text = "\(forecast.temp.min)º - \(forecast.temp.max)º"
        dateLabel.text = Date(timeIntervalSince1970: TimeInterval(forecast.dt)).format(with: "EEEE (dd MMM)")
        presureValueLabel.text = "\(forecast.pressure) hPa"
        humidityValueLabel.text = "\(forecast.humidity) %"
        windSpeedValueLabel.text = "\(forecast.speed) m/s"
        windDirectionLabel.text = "\(forecast.deg)º"
        tempoMorningLabel.text = "\(forecast.temp.morn)º"
        tempoDayLabel.text = "\(forecast.temp.day)º"
        tempoEveningLabel.text = "\(forecast.temp.eve)º"
        tempoNightLabel.text = "\(forecast.temp.night)º"
        
        ilFaitLabel.text = forecast.commentOnTempo()
        ilFaitLabel.isHidden = (ilFaitLabel.text?.count)! == 0
        
    }
    
    
}
