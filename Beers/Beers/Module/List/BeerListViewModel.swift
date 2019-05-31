//
//  BeerListViewModel.swift
//  Beers
//
//  Created by Andre Cocuroci on 31/05/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import Foundation

final class BeerListViewModel {
  
  private let repository: BeersDataProvider
  private var currentPage = 0
  private (set) var hasMoreResult = true
  private (set) var beers = [Beer]()
  
  private var isLoading = false
  
  var onResult: (() -> Void)?
  var onError: ((Error) -> Void)?
  
  init(repository: BeersDataProvider) {
    self.repository = repository
  }

  func requestList() {
    
    guard !isLoading, hasMoreResult else { return }
    
    isLoading = true
    currentPage += 1
    
    repository.list(page: currentPage) { [weak self] result in
      
      self?.isLoading = false
      
      DispatchQueue.main.async {
        switch result {
        case .success(let beers):
          if beers.count == 0 {
            self?.hasMoreResult = false
          } else {
            self?.beers += beers
            self?.onResult?()
          }
        case .failure(let error):
          self?.onError?(error)
        }
      }
    }
  }
}
