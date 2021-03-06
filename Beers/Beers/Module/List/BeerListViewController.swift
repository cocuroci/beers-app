//
//  BeerListViewController.swift
//  Beers
//
//  Created by Andre Cocuroci on 31/05/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import UIKit
import Kingfisher

enum DetailEvent: Event {
  case detail(beer: Beer)
}

final class BeersListViewController: UITableViewController {
  
  let viewModel: BeerListViewModel
  
  weak var coordinator: Coordinator?
  
  init(viewModel: BeerListViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Cervejas"
    
    viewModel.onResult = { [weak self] in
      self?.reloadData()
    }
    
    viewModel.onError = { [weak self] error in
      self?.showError(error: error)
    }
    
    tableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "ListCell")
    
    tableView.tableFooterView = UIView()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    viewModel.requestList()
  }
  
  private func reloadData() {
    tableView.reloadData()
  }
  
  private func showError(error: Error) {
    let alert = UIAlertController(title: "Atenção", message: error.localizedDescription, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    
    present(alert, animated: true, completion: nil)
  }
}

extension BeersListViewController {
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
    if tableView.isLast(for: indexPath) && viewModel.hasMoreResult {
      viewModel.requestList()
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.beers.count
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let beer = viewModel.beers[indexPath.row]
    coordinator?.handle(DetailEvent.detail(beer: beer))
    
    DispatchQueue.main.async {
      tableView.deselectRow(at: indexPath, animated: true)
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ListCell {
      let beer = viewModel.beers[indexPath.row]
      
      cell.iconImage.kf.setImage(with: beer.imageURL)
      cell.nameLabel.text = beer.name
      cell.abvLabel.text = "Teor alcoólico: \(beer.abv)"
      return cell
    }
    
    return UITableViewCell()
  }
}
