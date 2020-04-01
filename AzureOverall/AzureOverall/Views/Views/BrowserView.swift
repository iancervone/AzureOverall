//
//  BrowserView.swift
//  AzureOverall
//
//  Created by Ian Cervone on 3/27/20.
//  Copyright © 2020 Ian Cervone. All rights reserved.
//

import UIKit

class BrowserView: UIView {

  //MARK: UI Elements
    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        return search
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
      
      lazy var browseCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemBackground
        collection.register(BrowseCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifiers.browseCollectionViewCell.rawValue)
        return collection
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
        setUpCountStackView()
        setupSearchBar()
        setupBrowseCollectionView()
      }
      
//MARK: Constraints
  
  private func setUpCountStackView() {
    let stackView = UIStackView(arrangedSubviews: [cartIcon, counterLabel])
    stackView.axis = .horizontal
    stackView.distribution = .fillProportionally
    self.addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
          stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
          stackView.heightAnchor.constraint(equalToConstant: 45),
          stackView.widthAnchor.constraint(equalToConstant: 60)
        ])
      }
      
      private func setupSearchBar() {
        addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
          searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
          searchBar.trailingAnchor.constraint(equalTo: cartIcon.leadingAnchor, constant: -15),
          searchBar.heightAnchor.constraint(equalToConstant: 45)
        ])
      }
  
  private func setupBrowseCollectionView() {
    addSubview(browseCollectionView)
    browseCollectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      browseCollectionView.topAnchor.constraint(equalTo: cartIcon.bottomAnchor),
      browseCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
      browseCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      browseCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
    ])
  }
  

}
