//
//  CartView.swift
//  AzureOverall
//
//  Created by Ian Cervone on 3/31/20.
//  Copyright © 2020 Ian Cervone. All rights reserved.
//

import UIKit

class CartView: UIView {

//MARK: UI Elements
  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.thin)
    label.textAlignment = .center
    label.text = "Cart"
    label.backgroundColor = .systemBackground
    return label
  }()

  lazy var cartTableView: UITableView = {
    let table = UITableView(frame: .zero)
    table.register(CartTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.cartTableViewCell.rawValue)
    table.backgroundColor = .systemBackground
    return table
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
        setUpTitleLabel()
        setUpCartTableView()
    }
        
//MARK: Constraints
    private func setUpTitleLabel() {
    addSubview(titleLabel)
      titleLabel.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        titleLabel.heightAnchor.constraint(equalToConstant: 70)
      ])
    }
  
  private func setUpCartTableView() {
    addSubview(cartTableView)
    cartTableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      cartTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
      cartTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      cartTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
      cartTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
}
