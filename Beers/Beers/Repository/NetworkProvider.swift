//
//  NetworkProvider.swift
//  Beers
//
//  Created by Andre Cocuroci on 31/05/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import Foundation

protocol NetworkProvider {
  associatedtype Model
  func list(page: Int, onCompleted: @escaping (Result<Model, Error>) -> Void)
}
