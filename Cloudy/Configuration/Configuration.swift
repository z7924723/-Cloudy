//
//  Configuration.swift
//  Cloudy
//
//  Created by PinguMac on 2018/3/2.
//  Copyright © 2018 PinguMac. All rights reserved.
//

import Foundation

struct Defaults {
  
  static let Latitude: Double = 51.400592
  static let Longitude: Double = 4.760970
  
}

struct API {
  
  private init() {}
  
  static let APIKey = "3f8f57a00ad03b0f969cebf7178db3aa"
  static let BaseURL = URL(string: "https://api.darksky.net/forecast/")!
  
  static var AuthenticatedBaseURL: URL {
    return BaseURL.appendingPathComponent(APIKey)
  }
  
}
