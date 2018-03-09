//
//  SettingsViewTimeViewModel.swift
//  CloudyTests
//
//  Created by PinguMac on 2018/3/9.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsViewTimeViewModelTests: XCTestCase {
    
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
    
    // Reset User Defaults
    UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.timeNotation)
  }
  
  // MARK: - Tests for Text
  func testText_TwelveHour() {
    let viewModel = SettingsViewTimeViewModel(timeNotation: .twelveHour)
    
    XCTAssertEqual(viewModel.text, "12 Hour")
  }
  
  func testText_TwentyFourHour() {
    let viewModel = SettingsViewTimeViewModel(timeNotation: .twentyFourHour)
    
    XCTAssertEqual(viewModel.text, "24 Hour")
  }
  
  // MARK: - Tests for Accessory Type
  func testAccessoryType_TwelveHour_TwelveHour() {
    let timeNotation: TimeNotation = .twelveHour
    UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
    
    let viewModel = SettingsViewTimeViewModel(timeNotation: .twelveHour)
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
  }
  
  func testAccessoryType_TwelveHour_TwentyFourHour() {
    let timeNotation: TimeNotation = .twelveHour
    UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
    
    let viewModel = SettingsViewTimeViewModel(timeNotation: .twentyFourHour)
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
  }
  
  func testAccessoryType_TwentyFourHour_TwentyFourHour() {
    let timeNotation: TimeNotation = .twentyFourHour
    UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
    
    let viewModel = SettingsViewTimeViewModel(timeNotation: .twentyFourHour)
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
  }
  
  func testAccessoryType_TwentyFourHour_TwelveHour() {
    let timeNotation: TimeNotation = .twentyFourHour
    UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
    
    let viewModel = SettingsViewTimeViewModel(timeNotation: .twelveHour)
    XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
  }
}
