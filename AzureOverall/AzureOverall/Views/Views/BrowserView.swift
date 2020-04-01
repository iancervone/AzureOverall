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
        setUpCartIcon()
        setupSearchBar()
        setupBrowseCollectionView()
      }
      
//MARK: Constraints
    //NOTE: the cartIcon anchors the constraints for the other UI elements. Changing the cartIcon constraints will affect the other constraints.
  
      private func setUpCartIcon() {
        addSubview(cartIcon)
        cartIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          cartIcon.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
          cartIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
          cartIcon.heightAnchor.constraint(equalToConstant: 45),
          cartIcon.widthAnchor.constraint(equalToConstant: 45)
        ])
      }
      
      private func setupSearchBar() {
        addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          searchBar.topAnchor.constraint(equalTo: cartIcon.topAnchor),
          searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
          searchBar.trailingAnchor.constraint(equalTo: cartIcon.leadingAnchor, constant: 10),
          searchBar.heightAnchor.constraint(equalTo: cartIcon.heightAnchor)
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
