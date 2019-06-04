//
//  BeerUserCase.swift
//  Domain
//
//  Created by Andre Cocuroci on 04/06/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import Foundation

public typealias onComplete = (Result<[Beer], Error>) -> Void

public protocol BeerUseCase {
  func list(page: Int, onComplete: @escaping onComplete)
}
