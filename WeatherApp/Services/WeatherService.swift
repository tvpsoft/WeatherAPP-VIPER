//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import Foundation
import Alamofire

class WeatherService {
    static var shared = WeatherService()
    
    func getForcasts(completion : @escaping (_ result: ResultCallback<Weather>) -> Void){
        
        Alamofire.request(APIBuilder.ApiForcastParis16).responseWeather { response in
            
            if(response.error != nil){
                completion(ResultCallback.failure(ErrorType.noInternet))
                return
            }
            
            if let weather = response.result.value {
               completion(ResultCallback.success(weather))
            }
        }
    }
}
