//
//  WeatherDayViewViewModel.swift
//  Cloudy
//
//  Created by PinguMac on 2018/3/6.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

struct WeatherDayViewViewModel: WeatherDayRepresentable {

  // MARK: - Properties
  let dayData: DayData
  
  // MARK: -
  private let dayFormatter = DateFormatter()
  private let dateFormatter = DateFormatter()

  var day: String {
    dayFormatter.dateFormat = "EEEE"
    
    return dayFormatter.string(from: dayData.time)
  }
  
  var date: String {
    dateFormatter.dateFormat = "MMMM d"
    
    return dateFormatter.string(from: dayData.time)
  }
  
  var temperature: String {
    let min = format(temperature: dayData.temperatureMin)
    let max = format(temperature: dayData.temperatureMax)
    
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
    let windSpeed = dayData.windSpeed
    
    switch UserDefaults.unitsNotation() {
    case .imperial:
      return String(format: "%.f MPH", windSpeed)
    default:
      return String(format: "%.f KPH", windSpeed.toKPH())
    }
  }
  
  var image: String {
    return String(dayData.icon)
  }

}
