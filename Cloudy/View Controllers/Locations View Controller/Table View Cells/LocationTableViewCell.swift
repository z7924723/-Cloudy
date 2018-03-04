//
//  LocationTableViewCell.swift
//  Cloudy
//
//  Created by PinguMac on 10/07/2017.
//  Copyright © 2017 PinguMac. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
  
  // MARK: - Type Properties
  
  static let reuseIdentifier = "LocationCell"
  
  // MARK: - Properties
  
  @IBOutlet var mainLabel: UILabel!
  
  // MARK: - Initialization
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  // MARK: - Configuration
  
  func configure(withViewModel viewModel: LocationRepresentable) {
    mainLabel.text = viewModel.text
  }
  
}
