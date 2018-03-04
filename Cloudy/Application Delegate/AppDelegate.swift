//
//  AppDelegate.swift
//  Cloudy
//
//  Created by PinguMac on 2018/3/2.
//  Copyright © 2018 PinguMac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Configure Window
    window?.tintColor = UIColor(red:0.99, green:0.47, blue:0.44, alpha:1.0)
    
    return true
  }
  
}
