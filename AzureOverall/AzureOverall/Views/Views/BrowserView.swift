//
//  BrowserView.swift
//  AzureOverall
//
//  Created by Ian Cervone on 3/27/20.
//  Copyright © 2020 Ian Cervone. All rights reserved.
//

import UIKit

class BrowserView: UIView {

    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        return search
      }()
      
      lazy var cartIcon: UIImageView = {
        let image = UIImageView()
        return image
      }()
      
      lazy var browseCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemBackground
        collection.register(BrowseCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifiers.browseCollectionViewCell.rawValue)
        return collection
      }()
      

        override init(frame: CGRect) {
            super.init(frame: frame)
           
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
      
      private func setupViews() {
        
      }
      
      private func setUpCartIcon() {
        addSubview(cartIcon)
        cartIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          cartIcon.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
          cartIcon.trailingAnchor.constraint(equalTo: trailingAnchor),
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
          searchBar.trailingAnchor.constraint(equalTo: cartIcon.leadingAnchor),
//          searchBar.heightAnchor.constraint(equalToConstant: cartIcon.heightAnchor)
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
