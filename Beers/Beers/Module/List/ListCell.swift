//
//  ListCellT.swift
//  Beers
//
//  Created by Andre Cocuroci on 31/05/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {

  @IBOutlet weak var iconImage: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var abvLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    iconImage.image = nil
  }
}
