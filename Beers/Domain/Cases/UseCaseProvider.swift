//
//  UseCaseProvider.swift
//  Domain
//
//  Created by Andre Cocuroci on 04/06/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import Foundation

public protocol UseCaseProvider {
  func makeBeerUseCase() -> BeerUseCase
}
