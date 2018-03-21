//
//  WeatherDayRepresentable.swift
//  Cloudy
//
//  Created by PinguMac on 2018/3/6.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

protocol WeatherDayRepresentable {
  var day: String { get }
  var date: String { get }
  var image: String { get }
  var windSpeed: String { get }
  var temperature: String { get }
}
