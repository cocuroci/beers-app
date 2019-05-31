//
//  BeersDataProvider.swift
//  Beers
//
//  Created by Andre Cocuroci on 31/05/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import Foundation

final class BeersDataProvider: NetworkProvider {
  
  typealias Model = [Beer]
  
  let network: Network
  
  init(network: Network) {
    self.network = network
  }
  
  func list(page: Int, onCompleted: @escaping (Result<Model, Error>) -> Void) {
    network.request(routing: Router.list(page: page)) { result in
      switch result {
      case .success(let data):
        do {
          let result = try JSONDecoder().decode(Model.self, from: data)
          onCompleted(Result.success(result))
        } catch {
          onCompleted(Result.failure(error))
        }
      case .failure(let error):
        onCompleted(Result.failure(error))
      }
    }
  }
}
