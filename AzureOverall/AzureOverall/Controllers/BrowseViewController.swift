//
//  BrowseViewController.swift
//  AzureOverall
//
//  Created by Ian Cervone on 3/27/20.
//  Copyright © 2020 Ian Cervone. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {
  
//MARK: Variables
  
  var recipes = [Recipe]() {
    didSet {
      browserViews.browseCollectionView.reloadData()
    }
  }
  
  var searchString: String = ""
  
  
//MARK: UI Elements
  
  lazy var browserViews: BrowserView = {
    let browser = BrowserView()
    browser.searchBar.delegate = self
    browser.browseCollectionView.dataSource = self
    browser.browseCollectionView.delegate = self
    return browser
  }()

  
//MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}


//MARK: Extensions

extension BrowseViewController: UICollectionViewDelegate {
  
}


extension BrowseViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return recipes.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    <#code#>
  }
}


extension BrowseViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    let activityIndicator = UIActivityIndicatorView()
    activityIndicator.center = self.view.center
    activityIndicator.startAnimating()
    self.view.addSubview(activityIndicator)
    
    searchBar.resignFirstResponder()
  }
}
