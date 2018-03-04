//
//  Conversions.swift
//  Cloudy
//
//  Created by PinguMac on 03/10/16.
//  Copyright © 2018 PinguMac. All rights reserved.
//

import Foundation

extension Double {
  
  func toCelcius() -> Double {
    return ((self - 32.0) / 1.8)
  }
  
  func toKPH() -> Double {
    return (self * 1.609344)
  }
  
}
