//
//  WeatherDayViewViewModel.swift
//  Cloudy
//
//  Created by PinguMac on 2018/3/6.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

struct WeatherDayViewViewModel: WeatherDayRepresentable {

  // MARK: - Properties
  let weatherDayData: WeatherDayData
  
  // MARK: -
  private let dayFormatter = DateFormatter()
  private let dateFormatter = DateFormatter()

  var day: String {
    dayFormatter.dateFormat = "EEEE"
    
    return dayFormatter.string(from: weatherDayData.time)
  }
  
  var date: String {
    dateFormatter.dateFormat = "MMMM d"
    
    return dateFormatter.string(from: weatherDayData.time)
  }
  
  var temperature: String {
    let min = format(temperature: weatherDayData.temperatureMax)
    let max = format(temperature: weatherDayData.temperatureMax)
    
    return "\(min) - \(max)"
  }
  
  private func format(temperature: Double) -> String {
    switch UserDefaults.temperatureNotation() {
    case .fahrenheit:
      return String(format: "%.0f °F", temperature)
    default:
      return String(format: "%.0f °C", temperature.toCelcius())
    }
  }
  
  var windSpeed: String {
    let windSpeed = weatherDayData.windSpeed
    
    switch UserDefaults.unitsNotation() {
    case .imperial:
      return String(format: "%.f MPH", windSpeed)
    default:
      return String(format: "%.f KPH", windSpeed.toKPH())
    }
  }
  
  var image: UIImage? {
    return UIImage.imageForIcon(withName: weatherDayData.icon)
  }

}
