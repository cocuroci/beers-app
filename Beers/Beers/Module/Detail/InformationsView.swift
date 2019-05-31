//
//  InformationsView.swift
//  Beers
//
//  Created by Andre Cocuroci on 31/05/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import UIKit

final class InformationsView: UIView {
  
  lazy var titleLabel: UILabel = {
    let titleLabel = UILabel(frame: .zero)
    titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    return titleLabel
  }()
  
  lazy var descriptionLabel: UILabel = {
    let descriptionLabel = UILabel(frame: .zero)
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.numberOfLines = 0
    return descriptionLabel
  }()
  
  init() {
    super.init(frame: .zero)
    configureView()
    configureConstrains()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configureView()
    configureConstrains()
  }
  
  private func configureView() {
    addSubview(titleLabel)
    addSubview(descriptionLabel)
  }
  
  private func configureConstrains() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      
      descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
      descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
      descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      ])
  }
}

