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
  let weatherData: Daily

  var numberOfSection: Int {
    return 1
  }
  
  var numberOfDays: Int {
    return weatherData.data.count
  }
  
  func viewModel(for index: Int) -> WeatherDayViewViewModel {
    return WeatherDayViewViewModel(dayData: weatherData.data[index])
  }
  
}
