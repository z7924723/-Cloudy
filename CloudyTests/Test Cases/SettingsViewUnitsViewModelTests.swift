//
//  SettingsViewUnitsViewModelTests.swift
//  CloudyTests
//
//  Created by PinguMac on 2018/3/9.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsViewUnitsViewModelTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
    
    // Reset User Defaults
    UserDefaults.standard.removeObject(forKey: UserDefaults.Keys.unitsNotation)
  }

  // MARK: - Tests for Text
  func testText_Imperial() {
    let viewModel = SettingsViewUnitsViewModel(unitsNotation: .imperial)
    
    XCTAssertEqual(viewModel.text, "Imperial")
  }
  
  func testText_Metric() {
    let viewModel = SettingsViewUnitsViewModel(unitsNotation: .metric)
    
    XCTAssertEqual(viewModel.text, "Metric")
  }
  
  // MARK: - Tests for Accessory Type
  func testAccessoryType_Imperial_Imperial() {
    let unitsNotation: UnitsNotation = .imperial
    UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaults.Keys.unitsNotation)
    
    let viewModel = SettingsViewUnitsViewModel(unitsNotation: .imperial)
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
  }
  
  func testAccessoryType_Imperial_Metric() {
    let unitsNotation: UnitsNotation = .imperial
    UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaults.Keys.unitsNotation)
    
    let viewModel = SettingsViewUnitsViewModel(unitsNotation: .metric)
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
  }

  func testAccessoryType_Metric_Metric() {
    let unitsNotation: UnitsNotation = .metric
    UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaults.Keys.unitsNotation)
    
    let viewModel = SettingsViewUnitsViewModel(unitsNotation: .metric)
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
  }
  
  func testAccessoryType_Metric_Imperial() {
    let unitsNotation: UnitsNotation = .metric
    UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaults.Keys.unitsNotation)
    
    let viewModel = SettingsViewUnitsViewModel(unitsNotation: .imperial)
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
  }
}
