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
    return image
  }()

  lazy var recipeNameLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  lazy var servingsLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  lazy var timeLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  
// MARK: Initializers
   override init(frame: CGRect) {
       super.init(frame: frame)
      setUpCellView()
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
  
  
  
  
//MARK: Constraints
  private func setUpCellView() {
    setUpRecipeImage()
    setUpRecipeNameLabel()
    setUpBrowserStackView()
  }
  
  private func setUpRecipeImage() {
    contentView.addSubview(recipeImage)
    recipeImage.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      recipeImage.topAnchor.constraint(equalTo: contentView.topAnchor),
      recipeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      recipeImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      recipeImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7)
    ])
  }
  
  private func setUpRecipeNameLabel() {
    contentView.addSubview(recipeNameLabel)
    recipeNameLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      recipeNameLabel.topAnchor.constraint(equalTo: recipeImage.bottomAnchor),
      recipeNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      recipeNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      recipeNameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2)
    ])
  }
  
  private func setUpBrowserStackView() {
    let stackView = UIStackView(arrangedSubviews: [servingsLabel, timeLabel])
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    self.addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: recipeNameLabel.bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
}
