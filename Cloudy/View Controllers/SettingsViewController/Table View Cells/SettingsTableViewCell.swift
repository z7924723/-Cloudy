//
//  SettingsTableViewCell.swift
//  Cloudy
//
//  Created by PinguMac on 03/10/16.
//  Copyright © 2018 PinguMac. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    // MARK: - Type Properties

    static let reuseIdentifier = "SettingsCell"

    // MARK: - Properties

    @IBOutlet var mainLabel: UILabel!

    // MARK: - Initialization

    override func awakeFromNib() {
        super.awakeFromNib()

        // Configure Cell
        selectionStyle = .none
    }

}
