//
//  WeatherListViewController.swift
//  WeatherApp
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import UIKit

class WeatherListViewController: UICollectionViewController {
    
    var presenter: WeatherListPresentation?
    
    lazy var refreshControl: UIRefreshControl = {
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(handleRefresh(sender:)), for: .valueChanged)
        return rc
    }()
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Vestiaire Weather"
        presenter?.loadWeatherForecasts()
    }
    
    
    
    @objc private func handleRefresh(sender: UIRefreshControl) {
        presenter?.loadWeatherForecasts()
        sender.endRefreshing()
    }
    
    // MARK:- View Setups
    private func setupCollectionView() {
        collectionView?.backgroundColor = .white
        collectionView?.alwaysBounceVertical = true
        collectionView?.showsVerticalScrollIndicator = true
        collectionView?.register(ForecastCell.self, forCellWithReuseIdentifier: ForecastCell.cellName)
        collectionView?.refreshControl = refreshControl
    }
    
}

extension WeatherListViewController: WeatherListViewInterface {
    
    func refreshWeatherList() {
        self.collectionView?.reloadData()
    }
    
    
    func showLoadingError(errorMessage: String) {
        print("show error messagae: \(errorMessage)")
    }
}


// MARK:- CollectionView Delegates
extension WeatherListViewController: UICollectionViewDelegateFlowLayout {
    // Datasource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return presenter?.sections ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.forecastCount ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastCell.cellName,
                                                            for: indexPath) as? ForecastCell else { fatalError() }
        let forecast = presenter?.forecast(at: indexPath.item)
        cell.configCell(forecast)
        cell.tag = indexPath.item
        return cell
    }
    
    // Delegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let forecast = presenter?.forecast(at: indexPath.item) {
            presenter?.selectForecast(forecast)
        }
    }
    
    // Delegate Flowlayout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height : CGFloat = 50.0
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

