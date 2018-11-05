//
//  ResultCallback.swift
//  WeatherApp
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import Foundation

public enum ErrorType: Error {
    case noInternet
}

enum ResultCallback<T> {
    case success(T)
    case failure(ErrorType)
}
