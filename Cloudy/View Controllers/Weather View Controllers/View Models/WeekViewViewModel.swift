//
//  WeekViewViewModel.swift
//  Cloudy
//
//  Created by PinguMac on 2018/3/5.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

struct WeekViewViewModel {
  
  // MARK: - Properties
  let weatherDayData: [WeatherDayData]
  
  private let dayFormatter = DateFormatter()
  private let dateFormatter = DateFormatter()
  
  var numberOfSection: Int {
    return 1
  }
  
  var numberOfDays: Int {
    return weatherDayData.count
  }
  
  func day(for index: Int) -> String {
    let weatherDayData = self.weatherDayData[index]
    
    dayFormatter.dateFormat = "EEEE"
    
    return dayFormatter.string(from: weatherDayData.time)
  }
  
  func date(for index: Int) -> String	 {
    let weatherDayData = self.weatherDayData[index]
    
    dateFormatter.dateFormat = "MMMM d"
    
    return dateFormatter.string(from: weatherDayData.time)
  }
  
  func temperature(for index: Int) -> String {
    let weatherDayData = self.weatherDayData[index]
    
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
  
  func windSpeed(for index: Int) -> String {
    let weatherDayData = self.weatherDayData[index]
    let windSpeed = weatherDayData.windSpeed
    
    switch UserDefaults.unitsNotation() {
    case .imperial:
      return String(format: "%.f MPH", windSpeed)
    default:
      return String(format: "%.f KPH", windSpeed.toKPH())
    }
  }
  
  func image(for index: Int) -> String {
    let weatherDayData = self.weatherDayData[index]
    
    return weatherDayData.icon
  }
}
