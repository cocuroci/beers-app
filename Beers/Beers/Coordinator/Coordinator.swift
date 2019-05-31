//
//  Coordinator.swift
//  Beers
//
//  Created by Andre Cocuroci on 31/05/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import Foundation

protocol Event {}

protocol Coordinator: AnyObject {
  func start()
  func handle(_ event: Event)
}
