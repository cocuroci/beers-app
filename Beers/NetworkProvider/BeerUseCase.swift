//
//  BeerUseCase.swift
//  Network
//
//  Created by Andre Cocuroci on 04/06/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import Foundation
import Domain

final class BeerUseCase: Domain.BeerUseCase {

  let network: Network
  
  init(network: Network) {
    self.network = network
  }
  
  func list(page: Int, onComplete: @escaping Domain.onComplete) {
    self.network.request(routing: Router.list(page: page)) { result in
      switch result {
      case .success(let data):
        do {
          let result = try JSONDecoder().decode([Beer].self, from: data)
          onComplete(Result.success(result))
        } catch {
          onComplete(Result.failure(error))
        }
      case .failure(let error):
        onComplete(Result.failure(error))
      }
    }
  }
}
