//
//  AppCordinator.swift
//  Beers
//
//  Created by Andre Cocuroci on 31/05/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
  
  let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
    let listViewModel = BeerListViewModel(repository: BeersDataProvider(network: Network()))
    let listController = BeersListViewController(viewModel: listViewModel)
    listController.coordinator = self
    
    window.rootViewController = UINavigationController(rootViewController: listController)
  }
  
  private func showDetail(model: Beer) {
    
  }
  
  func handle(_ event: Event) {
    
  }
}
