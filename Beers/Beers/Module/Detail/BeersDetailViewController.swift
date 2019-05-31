//
//  BeersDetailViewController.swift
//  Beers
//
//  Created by Andre Cocuroci on 31/05/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import UIKit
import Kingfisher

class BeersDetailViewController: UIViewController {
  
  private let viewModel: BeerDetailViewModel
  
  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView(frame: .zero)
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  
  lazy var stackView: UIStackView = {
    let stackView = UIStackView(frame: .zero)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 10
    stackView.alignment = .top
    return stackView
  }()
  
  init(viewModel: BeerDetailViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
   
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    view.addSubview(scrollView)
    scrollView.addSubview(stackView)
    
    configureConstraints()
    configureViews()
  }
  
  private func configureConstraints() {
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: view.topAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
      
      stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
      ])
  }
  
  private func configureViews() {
    configureImage()
    configureName()
    configureTagline()
    configureAbv()
    configureIbu()
    configureDescription()
  }
  
  private func configureImage() {
    if let imageURL =  viewModel.beer.imageURL {
      let containerImage = UIView()
      
      let imageView = UIImageView()
      imageView.translatesAutoresizingMaskIntoConstraints = false
      
      imageView.kf.setImage(with: imageURL)
      imageView.contentMode = .scaleAspectFit
      stackView.addArrangedSubview(containerImage)
      containerImage.addSubview(imageView)
      
      NSLayoutConstraint.activate([
        containerImage.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1),
        
        imageView.heightAnchor.constraint(equalToConstant: 300),
        imageView.topAnchor.constraint(equalTo: containerImage.topAnchor, constant: 16),
        imageView.bottomAnchor.constraint(equalTo: containerImage.bottomAnchor, constant: 0),
        imageView.centerXAnchor.constraint(equalTo: containerImage.centerXAnchor),
      ])
    }
  }
  
  private func configureName() {
    let nameInformation = InformationsView()
    nameInformation.titleLabel.text = "Nome:"
    nameInformation.descriptionLabel.text = viewModel.beer.name
    stackView.addArrangedSubview(nameInformation)
  }
  
  private func configureTagline() {
    let taglineInformation = InformationsView()
    taglineInformation.titleLabel.text = "Tagline:"
    taglineInformation.descriptionLabel.text = viewModel.beer.tagline
    stackView.addArrangedSubview(taglineInformation)
  }
  
  private func configureAbv() {
    let abvInformation = InformationsView()
    abvInformation.titleLabel.text = "Teor alcoólico:"
    abvInformation.descriptionLabel.text = "\(viewModel.beer.abv)"
    stackView.addArrangedSubview(abvInformation)
  }
  
  private func configureIbu() {
    if let ibu = viewModel.beer.ibu {
      let ibuInformation = InformationsView()
      ibuInformation.titleLabel.text = "Escala de amargor:"
      ibuInformation.descriptionLabel.text = "\(ibu)"
      stackView.addArrangedSubview(ibuInformation)
    }
  }
  
  private func configureDescription() {
    let descriptionInformation = InformationsView()
    descriptionInformation.titleLabel.text = "Descrição:"
    descriptionInformation.descriptionLabel.text = "\(viewModel.beer.description)"
    stackView.addArrangedSubview(descriptionInformation)
  }
}
