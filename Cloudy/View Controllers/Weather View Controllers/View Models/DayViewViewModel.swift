//
//  DayViewViewModel.swift
//  Cloudy
//
//  Created by PinguMac on 2018/3/4.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

struct DayViewViewModel {
  // MARK: - Properties
  let weatherData: WeatherData
  
  // MARK: -
  private let dateFormatter = DateFormatter()
  
  // MARK: - Day View Label
  var date: String {
    dateFormatter.dateFormat = "EEE, MMMM d"
    return dateFormatter.string(from: weatherData.time)
  }
  
  var time: String {
    dateFormatter.dateFormat = UserDefaults.timeNotation().timeFormat
    return dateFormatter.string(from: weatherData.time)
  }
  
  var summary: String {
    return weatherData.summary
  }
  
  var temperature: String {
    let temperature = weatherData.temperature
    
    switch UserDefaults.temperatureNotation() {
    case .fahrenheit:
      return String(format: "%.1f  °F", temperature)
    default:
      return String(format: "%.1f °C", temperature.toCelcius())
    }
  }
  
  var windSpeed: String {
    let windSpeed = weatherData.windSpeed
    
    switch UserDefaults.unitsNotation() {
    case .imperial:
      return String(format: "%.f MPH", windSpeed)
    default:
      return String(format: "%.f KPH", windSpeed.toKPH())
    }
  }
  
  var image: String {
    return String(weatherData.icon)
  }
}
