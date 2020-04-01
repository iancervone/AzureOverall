//
//  CartTableViewCell.swift
//  AzureOverall
//
//  Created by Ian Cervone on 3/27/20.
//  Copyright © 2020 Ian Cervone. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
  
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
  
  lazy var cartIcon: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "cart.fill"), for: .normal)
    return button
  }()
  
  lazy var counterLabel: UILabel = {
      let label = UILabel()
      label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.regular)
      return label
    }()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: CellIdentifiers.cartTableViewCell.rawValue)
    setupViews()
  }
   required init?(coder aDecoder: NSCoder) {
     super.init(coder: aDecoder)
   }

  private func setupViews() {
    setUprecipeImage()
    setUpCountStackView()
    setUprecipeNameLabel()
  }
  
  
  private func setUprecipeImage() {
    contentView.addSubview(recipeImage)
    recipeImage.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      recipeImage.topAnchor.constraint(equalTo: contentView.topAnchor),
      recipeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
      recipeImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -5),
      recipeImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -5)
    ])
  }
  
  private func setUprecipeNameLabel() {
    contentView.addSubview(recipeNameLabel)
    recipeNameLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      recipeNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
      recipeNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      recipeNameLabel.leadingAnchor.constraint(equalTo: recipeImage.leadingAnchor, constant: 10),
      recipeNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30)
    ])
  }
  
  private func setUpCountStackView() {
    let stackView = UIStackView(arrangedSubviews: [counterLabel, cartIcon])
    stackView.axis = .vertical
    stackView.distribution = .fillProportionally
    contentView.addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
          stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
          stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -5),
          stackView.widthAnchor.constraint(equalTo: contentView.heightAnchor, constant: -5)
        ])
      }

}
