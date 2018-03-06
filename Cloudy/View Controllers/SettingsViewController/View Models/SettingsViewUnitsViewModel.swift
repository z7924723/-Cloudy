//
//  SettingsViewUnitsViewModel.swift
//  Cloudy
//
//  Created by PinguMac on 2018/3/6.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

struct SettingsViewUnitsViewModel: SettingsRepresentable {
  
  // MARK: - Properties
  let unitsNotation: UnitsNotation
  
  // MARK: - Public Interface
  var text: String {
    switch unitsNotation {
    case .imperial:
      return "Imperial"
    case .metric:
      return "Metric"
    }
  }
  
  var accessoryType: UITableViewCellAccessoryType {
    if UserDefaults.unitsNotation() == unitsNotation {
      return .checkmark
    } else {
      return .none
    }
  }
  
}
