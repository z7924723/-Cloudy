//
//  XCTestCase.swift
//  CloudyTests
//
//  Created by PinguMac on 2018/3/9.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import XCTest

extension XCTest {
  func loadStubFromBundle(withName name: String, fileExtension: String) -> Data {
    let bundle = Bundle(for: classForCoder)
    
    let url = bundle.url(forResource: name, withExtension: fileExtension)
    if url == nil {
      XCTFail("Missing file: \(name).\(fileExtension)")
    }
    
    return try! Data(contentsOf: url!)
  }
}
