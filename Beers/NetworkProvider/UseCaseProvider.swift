//
//  UseCaseProvider.swift
//  Network
//
//  Created by Andre Cocuroci on 04/06/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import Foundation
import Domain

public final class UseCaseProvider: Domain.UseCaseProvider {
  
  private let networkProvider: Network
  
  public init() {
    networkProvider = Network()
  }
  
  public func makeBeerUseCase() -> Domain.BeerUseCase {
    return BeerUseCase(network: networkProvider)
  }
}
