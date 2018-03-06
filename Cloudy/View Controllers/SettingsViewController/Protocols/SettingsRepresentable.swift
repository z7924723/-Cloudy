//
//  SettingsRepresentable.swift
//  Cloudy
//
//  Created by PinguMac on 2018/3/6.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

protocol SettingsRepresentable {
  var text: String { get }
  var accessoryType: UITableViewCellAccessoryType { get }
}
