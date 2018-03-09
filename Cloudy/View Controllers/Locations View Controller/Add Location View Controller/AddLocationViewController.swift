//
//  AddLocationViewController.swift
//  Cloudy
//
//  Created by PinguMac on 10/07/2017.
//  Copyright © 2017 PinguMac. All rights reserved.
//

import UIKit
import CoreLocation

protocol AddLocationViewControllerDelegate {
  func controller(_ controller: AddLocationViewController, didAddLocation location: Location)
}

class AddLocationViewController: UIViewController {
  
  // MARK: - Properties
  @IBOutlet var tableView: UITableView!
  @IBOutlet var searchBar: UISearchBar!
  @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
  
  // MARK: -
  var delegate: AddLocationViewControllerDelegate?
  
  // MARK: -
  var viewModel: AddLocationViewViewModel!
  
  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Add Location"
    
    // Initialize View Model
    viewModel = AddLocationViewViewModel()
    
    // Configure View Model
    viewModel.queryingDidChange = { [unowned self] (querying) in
      if querying {
        self.activityIndicatorView.startAnimating()
      } else {
        self.activityIndicatorView.stopAnimating()
      }
    }
    
    viewModel.locationsDidChange = { [unowned self] (locations) in
      self.tableView.reloadData()
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    // Show Keyboard
    searchBar.becomeFirstResponder()
  }
  
  // MARK: - View Methods
  
  private func setupView() {
    
  }
  
  private func updateView() {
    
  }
  
}

extension AddLocationViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfLocations
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.reuseIdentifier, for: indexPath) as? LocationTableViewCell else { fatalError("Unexpected Table View Cell") }
    
    if let viewModel = viewModel.viewModelForLocation(at: indexPath.row) {
      // Configure Table View Cell
      cell.configure(withViewModel: viewModel)
    }
    
    return cell
  }
  
}

extension AddLocationViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let location = viewModel.location(at: indexPath.row) else {
      return
    }
    
    // Notify Delegate
    delegate?.controller(self, didAddLocation: location)
    
    // Pop View Controller From Navigation Stack
    navigationController?.popViewController(animated: true)
  }
  
}

extension AddLocationViewController: UISearchBarDelegate {
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    // Hide Keyboard
    searchBar.resignFirstResponder()
    
    // Forward Geocode Address String
    viewModel.query = searchBar.text ?? ""
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    // Hide Keyboard
    searchBar.resignFirstResponder()
    
    // Forward Geocode Address String
    viewModel.query = searchBar.text ?? ""
  }
  
}
