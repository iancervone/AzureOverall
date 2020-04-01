//
//  DetailView.swift
//  AzureOverall
//
//  Created by Ian Cervone on 3/31/20.
//  Copyright © 2020 Ian Cervone. All rights reserved.
//

import UIKit

class DetailView: UIView {

//MARK: UI Elements
  lazy var recipeImage: UIImageView = {
    let image = UIImageView()
    image.contentMode = .center
    image.contentMode = .scaleAspectFit
    return image
  }()

  lazy var recipeNameLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 2
    label.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.thin)
    return label
  }()
  
  lazy var servingsLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular)
    return label
  }()
  
  lazy var timeLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular)
    return label
  }()
  
  lazy var cartIcon: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "cart.fill"), for: .normal)
    return button
  }()
  
  lazy var counterLabel: UILabel = {
    let label = UILabel()
    label.textColor = .systemBlue
    label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.regular)
    return label
  }()
  
  lazy var cartCountStepper: UIStepper = {
    let stepper = UIStepper()
    return stepper
  }()
  
      
// MARK: Initializers
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    setupViews()
  }
        
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
      
  private func setupViews() {
    setUpRecipeNameLabel()
    setUpRecipeImage()
    setUpBrowserStackView()
    setUpCartCountStepper()
    setUpCountStackView()
  }
      
//MARK: Constraints
  
  private func setUpRecipeNameLabel() {
      addSubview(recipeNameLabel)
      recipeNameLabel.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        recipeNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
        recipeNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        recipeNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        recipeNameLabel.heightAnchor.constraint(equalToConstant: 80)
      ])
    }
  
  private func setUpRecipeImage() {
    addSubview(recipeImage)
    recipeImage.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      recipeImage.topAnchor.constraint(equalTo: recipeNameLabel.bottomAnchor, constant: 10),
      recipeImage.leadingAnchor.constraint(equalTo: leadingAnchor),
      recipeImage.trailingAnchor.constraint(equalTo: trailingAnchor),
      recipeImage.heightAnchor.constraint(equalTo: widthAnchor)
    ])
  }
  
  private func setUpBrowserStackView() {
    let stackView = UIStackView(arrangedSubviews: [servingsLabel, timeLabel])
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    self.addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: 5),
      stackView.heightAnchor.constraint(equalToConstant: 20),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }

  private func setUpCountStackView() {
    let stackView = UIStackView(arrangedSubviews: [cartIcon, counterLabel])
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    self.addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.bottomAnchor.constraint(equalTo: cartCountStepper.topAnchor),
      stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
      stackView.heightAnchor.constraint(equalToConstant: 45),
      stackView.widthAnchor.constraint(equalToConstant: 45)
    ])
  }
      
  private func setUpCartCountStepper() {
    addSubview(cartCountStepper)
    cartCountStepper.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      cartCountStepper.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40),
      cartCountStepper.centerXAnchor.constraint(equalTo: centerXAnchor),
      cartCountStepper.widthAnchor.constraint(equalToConstant: 100),
      cartCountStepper.heightAnchor.constraint(equalToConstant: 50)
        ])
  }
  


}
