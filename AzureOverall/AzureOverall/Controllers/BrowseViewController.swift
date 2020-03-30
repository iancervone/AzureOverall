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
  
  
  
//MARK: Private Functions
  
  private func getRecipes() {
    DispatchQueue.main.async {
      SpoonacularAPIClient.manager.getRecipes(from: self.searchString){(result) in
        switch result {
        case let .success(recipeResults):
          self.recipes = recipeResults
        case let .failure(error):
          self.displayErrorAlert(with: error)
        }
      }
    }
  }
  
  func displayErrorAlert(with error: AppError) {
    let alertVC = UIAlertController(title: "Error Fetching Data", message: "\(error)", preferredStyle: .alert)
    alertVC.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
    present(alertVC, animated: true, completion: nil)
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
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.browseCollectionViewCell.rawValue, for: indexPath) as! BrowseCollectionViewCell
      cell.recipeNameLabel.text = recipes[indexPath.row].title
      cell.servingsLabel.text = "Servings =  \(recipes[indexPath.row].servings)"
      cell.timeLabel.text = "Cook time = \(recipes[indexPath.row].readyInMinutes)"
    return cell
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
