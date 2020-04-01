//
//  BrowseCollectionViewCell.swift
//  AzureOverall
//
//  Created by Ian Cervone on 3/27/20.
//  Copyright © 2020 Ian Cervone. All rights reserved.
//

import UIKit

class BrowseCollectionViewCell: UICollectionViewCell {
  
//MARK: UI Elements
  lazy var recipeImage: UIImageView = {
    let image = UIImageView()
    image.contentMode = .center
    image.contentMode = .scaleAspectFit
    return image
  }()

  lazy var recipeNameLabel: UILabel = {
    let label = UILabel()
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 2
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
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
  
  
// MARK: Initializers
   override init(frame: CGRect) {
       super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0, green: 0.8224349567, blue: 1, alpha: 1)
//    self.layer.borderWidth = 2
//    self.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setUpCellView()
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
  
  
  
  
//MARK: Constraints
  private func setUpCellView() {
    setUpRecipeNameLabel()
    setUpBrowserStackView()
    setUpRecipeImage()
  }
  
  private func setUpRecipeNameLabel() {
    contentView.addSubview(recipeNameLabel)
    recipeNameLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      recipeNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
      recipeNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      recipeNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
      recipeNameLabel.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  private func setUpRecipeImage() {
    contentView.addSubview(recipeImage)
    recipeImage.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      recipeImage.topAnchor.constraint(equalTo: recipeNameLabel.bottomAnchor, constant: 1),
      recipeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
      recipeImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
//      recipeImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7)
      recipeImage.bottomAnchor.constraint(equalTo: servingsLabel.topAnchor, constant: -5)
    ])
  }
  
  private func setUpBrowserStackView() {
    let stackView = UIStackView(arrangedSubviews: [servingsLabel, timeLabel])
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    self.addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.heightAnchor.constraint(equalToConstant: 20),
      stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
    ])
  }
  
}
