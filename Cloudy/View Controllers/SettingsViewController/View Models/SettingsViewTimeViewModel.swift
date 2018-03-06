//
//  SettingViewViewModel.swift
//  Cloudy
//
//  Created by PinguMac on 2018/3/6.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

struct SettingsViewTimeViewModel {
  
  // MARK: - Properties
  let timeNotation: TimeNotation
  
  // MARK: - Public Interface
  var text: String {
    switch timeNotation {
    case .twelveHour:
      return "12 Hour"
    default:
      return "24 Hour"
    }
  }
  
  var accessoryType: UITableViewCellAccessoryType {
    if UserDefaults.timeNotation() == timeNotation {
      return .checkmark
    } else {
      return .none
    }
  }
  
  
}
