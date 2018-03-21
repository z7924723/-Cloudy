//
//  WeatherDayViewViewModelTests.swift
//  CloudyTests
//
//  Created by PinguMac on 2018/3/13.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import XCTest
@testable import Cloudy

class WeatherDayViewViewModelTests: XCTestCase {
  
  // MARK: - Properties
  var viewModel: WeatherDayViewViewModel!

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // Load Stub
    let data = loadStubFromBundle(withName: "darksky", fileExtension: "json")
    let weatherData: WeatherData = try! JSONDecoder.decode(data: data)
    
    // Initialize View Model
    viewModel = WeatherDayViewViewModel(weatherDayData: weatherData.dailyData[5])

  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
    
    UserDefaults.standard.removeObject(forKey: UserDefaults.Keys.timeNotation)
    UserDefaults.standard.removeObject(forKey: UserDefaults.Keys.temperatureNotation)
    UserDefaults.standard.removeObject(forKey: UserDefaults.Keys.unitsNotation)
  }
  
  // MARK: - Tests for Day
  func testDay() {
    XCTAssertEqual(viewModel.day, "Wednesday")
  }
  
  // MARK: - Tests for Date
  func testDate() {
    XCTAssertEqual(viewModel.date, "March 14")
  }
  
  // MARK: - Tests for Temperature
  func testTemperature_Fahrenheit() {
    let temperatureNotation: TemperatureNotation = .fahrenheit
    UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaults.Keys.temperatureNotation)
    
    XCTAssertEqual(viewModel.temperature, "48 °F - 56 °F")
  }
  
  func testTemperature_Celsius() {
    let temperatureNotation: TemperatureNotation = .celsius
    UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaults.Keys.temperatureNotation)
    
    XCTAssertEqual(viewModel.temperature, "9 °C - 13 °C")
  }
  
  // MARK: - Tests for Wind Speed
  func testWindSpeed_Imperial() {
    let unitsNotation: UnitsNotation = .imperial
    UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaults.Keys.unitsNotation)
    
    XCTAssertEqual(viewModel.windSpeed, "8 MPH")
  }
  
  func testWindSpeed_Metric() {
    let unitsNotation: UnitsNotation = .metric
    UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaults.Keys.unitsNotation)
    
    XCTAssertEqual(viewModel.windSpeed, "14 KPH")
  }
  
  // MARK: - Tests for Image
  func testImage() {
    let viewModelImage = viewModel.image
    let imageDataViewModel = UIImagePNGRepresentation(UIImage(named: viewModelImage)!)!
    let imageDataReference = UIImagePNGRepresentation(UIImage(named: "rain")!)!
    
    XCTAssertNotNil(viewModelImage)
    XCTAssertEqual(UIImage(named: viewModelImage)?.size.width, 173.0)
    XCTAssertEqual(UIImage(named: viewModelImage)?.size.height, 174.0)
    XCTAssertEqual(imageDataViewModel, imageDataReference)
  }
}
