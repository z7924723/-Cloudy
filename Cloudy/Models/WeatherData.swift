//
//  WeatherData.swift
//  Cloudy
//
//  Created by PinguMac on 2018/3/2.
//  Copyright © 2018 PinguMac. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
  let latitude: Double
  let longitude: Double
  let currently: Currently
  let daily: Daily
}

struct Currently: Codable {
  let time: Date
  let summary: String
  let icon: String
  let temperature: Double
  let windSpeed: Double
}

struct Daily: Codable {
  let data: [DayData]
}

struct DayData: Codable {
  let time: Date
  let icon: String
  let temperatureMin: Double
  let temperatureMax: Double
  let windSpeed: Double
}
