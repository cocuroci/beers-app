//
//  UITableView+Extensions.swift
//  Beers
//
//  Created by Andre Cocuroci on 31/05/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import UIKit

extension UITableView {
  func isLast(for indexPath: IndexPath) -> Bool {
    let indexOfLastSection = numberOfSections > 0 ? numberOfSections - 1 : 0
    let indexOfLastRowInLastSection = numberOfRows(inSection: indexOfLastSection) - 1
    return indexPath.section == indexOfLastSection && indexPath.row == indexOfLastRowInLastSection
  }
}
