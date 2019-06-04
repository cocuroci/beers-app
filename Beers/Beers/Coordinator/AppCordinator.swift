//
//  AppCordinator.swift
//  Beers
//
//  Created by Andre Cocuroci on 31/05/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import UIKit
import Domain
import NetworkProvider

final class AppCoordinator: Coordinator {
  
  let window: UIWindow
  
  lazy var rootViewController = UINavigationController()
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
    let useCaseProvider = NetworkProvider.UseCaseProvider()
    
    let listViewModel = BeerListViewModel(repository: BeersDataProvider(beerUseCase: useCaseProvider.makeBeerUseCase()))
    let listController = BeersListViewController(viewModel: listViewModel)
    listController.coordinator = self
    
    rootViewController.setViewControllers([listController], animated: true)
    window.rootViewController = rootViewController
  }
  
  private func showDetail(beer: Beer) {
    let detailViewModel = BeerDetailViewModel(beer: beer)
    let detailViewControler = BeersDetailViewController(viewModel: detailViewModel)
    
    rootViewController.pushViewController(detailViewControler, animated: true)
  }
  
  func handle(_ event: Event) {
    switch event {
    case DetailEvent.detail(let beer):
      showDetail(beer: beer)
    default: ()
    }
  }
}
