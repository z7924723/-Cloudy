//
//  SettingsViewTemperatureViewModel.swift
//  Cloudy
//
//  Created by PinguMac on 2018/3/6.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

struct SettingsViewTemperatureViewModel: SettingsRepresentable {
  
  // MARK: - Properties
  var temperatureNotation: TemperatureNotation
  
  // MARK: - Public Interface
  var text: String {
    switch temperatureNotation {
    case .fahrenheit:
      return "Fahrenheit"
    default:
      return "Celcius"
    }
  }

  var accessoryType: UITableViewCellAccessoryType {
    if UserDefaults.temperatureNotation() == temperatureNotation {
      return .checkmark
    } else {
      return .none
    }
  }
  
}
