//
//  DayViewViewModelTests.swift
//  CloudyTests
//
//  Created by PinguMac on 2018/3/9.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import XCTest
@testable import Cloudy

class DayViewViewModelTests: XCTestCase {
  
  // MARK: - Properties
  var viewModel: DayViewViewModel!
  
  override func setUp() {
    super.setUp()
    
    // Load Stub
    let data = loadStubFromBundle(withName: "darksky", fileExtension: "json")
    let weatherData: WeatherData = try! JSONDecoder.decode(data: data)
    
    // Initialize View Model
    viewModel = DayViewViewModel(weatherData: weatherData)
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
    
    UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.timeNotation)
    UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.temperatureNotation)
    UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
  }
  
  // MARK: - Tests for Date
  func testDate() {
    XCTAssertEqual(viewModel.date, "Fri, March 9")
  }
  
  // MARK: - Tests for Time
  func testTime_TwelveHour() {
    let timeNotation: TimeNotation = .twelveHour
    UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
    
    XCTAssertEqual(viewModel.time, "04:56 PM")
  }
  
  func testTime_twentyFourHour() {
    let timeNotation: TimeNotation = .twentyFourHour
    UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
    
    XCTAssertEqual(viewModel.time, "16:56")
  }
  
  // MARK: - Tests for Summary
  func testSummary() {
    XCTAssertEqual(viewModel.summary, "Clear")
  }
  
  // MARK: - Test for Temperature
  func testTemperature_Fahrenheit() {
    let temperatureNotation: TemperatureNotation = .fahrenheit
    UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
    
    XCTAssertEqual(viewModel.temperature, "49.1 °F")
  }
  
  func testTemperature_Celsius() {
    let temperatureNotation: TemperatureNotation = .celsius
    UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
    
    XCTAssertEqual(viewModel.temperature, "9.5 °C")
  }
  
  // MARK: - Test for Wind Speed
  func testWindSpeed_Imperial() {
    let unitsNotation: UnitsNotation = .imperial
    UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
    
    XCTAssertEqual(viewModel.windSpeed, "3 MPH")
  }
  
  func testWindSpeed_Metric() {
    let unitsNotation: UnitsNotation = .metric
    UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
    
    XCTAssertEqual(viewModel.windSpeed, "4 KPH")
  }
  
  
  // MARK: - Test for Image Icon
  func testImage() {
    let viewModelImage = viewModel.image
    let imageDataViewModel = UIImagePNGRepresentation(UIImage(named: viewModelImage)!)
    let imageDataReference = UIImagePNGRepresentation(UIImage(named: "clear-night")!)!
    
    XCTAssertNotNil(viewModelImage)
    XCTAssertEqual(UIImage(named: viewModelImage)?.size.width, 236.0)
    XCTAssertEqual(UIImage(named: viewModelImage)?.size.height, 236.0)
    XCTAssertEqual(imageDataViewModel, imageDataReference)
  }

}

