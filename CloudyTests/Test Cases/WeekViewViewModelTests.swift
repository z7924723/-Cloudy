//
//  WeekViewViewModelTests.swift
//  CloudyTests
//
//  Created by PinguMac on 2018/3/13.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import XCTest
@testable import Cloudy

class WeekViewViewModelTests: XCTestCase {
  
  // MARK: - Properties
  var viewModel: WeekViewViewModel!
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // Load Stub
    let data = loadStubFromBundle(withName: "darksky", fileExtension: "json")
    let weatherData: WeatherData = try! JSONDecoder.decode(data: data)
    
    // Initialize View Model
    viewModel = WeekViewViewModel(weatherData: weatherData.dailyData)
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  // MARK: - Test for Number Of Sections
  func testNumberOfSections() {
    XCTAssertEqual(viewModel.numberOfSection, 1)
  }
  
  // MARK: - Test for Number Of Days
  func testNumberOfDays() {
    XCTAssertEqual(viewModel.numberOfDays, 8)
  }
  
  // MARK: - Test for View Model for Index
  func testViewModelOfIndex() {
    let weatherDayViewViewModel = viewModel.viewModel(for: 5)
    
    XCTAssertEqual(weatherDayViewViewModel.day, "Wednesday")
    XCTAssertEqual(weatherDayViewViewModel.date, "March 14")
  }
}
