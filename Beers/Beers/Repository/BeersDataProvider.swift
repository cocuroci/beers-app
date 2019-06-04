//
//  BeersDataProvider.swift
//  Beers
//
//  Created by Andre Cocuroci on 31/05/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import Foundation
import Domain
import NetworkProvider

final class BeersDataProvider {
  
  private let beerUseCase: Domain.BeerUseCase
  
  init(beerUseCase: Domain.BeerUseCase) {
    self.beerUseCase = beerUseCase
  }
  
  func list(page: Int, onCompleted: @escaping (Result<[Beer], Error>) -> Void) {
    self.beerUseCase.list(page: page, onComplete: onCompleted)
  }
}
