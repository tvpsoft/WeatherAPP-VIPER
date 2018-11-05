//
//  RootViewControllerGettable.swift
//  WeatherApp
//
//  Created by Phuong on 05/11/2018.
//  Copyright © 2018 PhuongTRAN. All rights reserved.
//

import UIKit

extension UIApplication {
    var rootViewController: UIViewController?{
        if keyWindow?.rootViewController == nil{
            return keyWindow?.rootViewController
        }
        
        var pointedViewController = keyWindow?.rootViewController
        
        while  pointedViewController?.presentedViewController != nil {
            switch pointedViewController?.presentedViewController {
            case let navagationController as UINavigationController:
                pointedViewController = navagationController.viewControllers.last
            case let tabBarController as UITabBarController:
                pointedViewController = tabBarController.selectedViewController
            default:
                pointedViewController = pointedViewController?.presentedViewController
            }
        }
        return pointedViewController
    }
}

protocol RootViewControllerGettable  {
    var rootViewController: UIViewController? { get }
    var rootNavController: UINavigationController? { get }
    var rootTabController: UITabBarController? { get }
}

extension RootViewControllerGettable {
    var rootViewController: UIViewController? {
        return UIApplication.shared.rootViewController
    }
    
    var rootNavController: UINavigationController? {
        return UIApplication.shared.rootViewController as? UINavigationController
    }
    
    var rootTabController: UITabBarController? {
        return UIApplication.shared.rootViewController as? UITabBarController
    }
}
