//
//  UIImage.swift
//  Cloudy
//
//  Created by PinguMac on 2018/3/6.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

extension UIImage {
  
  class func imageForIcon(withName name: String) -> UIImage? {
    switch name {
    case "clear-day", "clear-night", "rain", "snow", "sleet":
      return UIImage(named: name)
      
    case "wind", "cloudy", "partly-cloudy-day", "partly-cloudy-night":
      return UIImage(named: "cloudy")
      
    default:
      return UIImage(named: "clear-day")
    }
  }
  
}
