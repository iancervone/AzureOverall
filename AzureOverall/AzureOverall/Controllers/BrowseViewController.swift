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
  var recipes: AllRecipes?
  
  var searchString: String = ""
  
  var cartCounter = Double(0) {
    didSet {
      
    }
  }
    
  
//MARK: UI Elements
  lazy var browserViews: BrowserView = {
    let browser = BrowserView()
    browser.searchBar.delegate = self
    browser.browseCollectionView.dataSource = self
    browser.browseCollectionView.delegate = self
    browser.counterLabel.text = " \(Int(cartCounter))"
    browser.cartIcon.addTarget(self, action: #selector(goToCart), for: .touchUpInside)
    return browser
  }()

  
//MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
      view.addSubview(browserViews)
      view.backgroundColor = .systemBackground
    }
  
  
  
//MARK: Private Functions
  
  private func getRecipes() {
    DispatchQueue.main.async {
      SpoonacularAPIClient.manager.getRecipes(from: self.searchString){(result) in
        switch result {
        case let .success(recipeResults):
          self.recipes = recipeResults
          self.browserViews.browseCollectionView.reloadData()
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

//MARK: OBJC Methods
  
  @objc func goToCart() {
    let nextVC = CartViewController()
    let navController = UINavigationController(rootViewController: nextVC)
    self.present(navController, animated: true, completion: nil)
  }
}




//MARK: Extensions

extension BrowseViewController: UICollectionViewDelegate {
  
}


extension BrowseViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return recipes?.results.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.browseCollectionViewCell.rawValue, for: indexPath) as! BrowseCollectionViewCell
    cell.recipeNameLabel.text = recipes?.results[indexPath.row].title ?? " "
    cell.servingsLabel.text = "Servings:  \(recipes!.results[indexPath.row].servings)"
      cell.timeLabel.text = "Cook time: \(recipes!.results[indexPath.row].readyInMinutes) min"
    guard let url = "https://spoonacular.com/recipeImages/\(recipes!.results[indexPath.row].imageUrls[0])" as? String else { return cell}
      ImageHelper.shared.getImage(urlStr: url) {(result) in
        DispatchQueue.main.async {
          switch result {
          case .failure (let error):
            print(url)
            print("oh no \(error)")
          case .success (let image):
            cell.recipeImage.image = image
          }
        }
      }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let nextVC = RecipeDetailViewController()
    let navController = UINavigationController(rootViewController: nextVC)
    let selectedRecipe = recipes?.results[indexPath.row]
    nextVC.recipeDetails = selectedRecipe
    self.present(navController, animated: true, completion: nil)
  }
}

extension BrowseViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let cellSize = CGSize(width: (view.frame.width) - 18, height: (view.frame.width) * 0.75)
        return cellSize
    }
}


extension BrowseViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    searchString = searchBar.text?.lowercased() ?? ""
  }
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//    let activityIndicator = UIActivityIndicatorView()
//    activityIndicator.center = self.view.center
//    activityIndicator.startAnimating()
//    self.view.addSubview(activityIndicator)
    print(searchString)
    getRecipes()
    searchBar.resignFirstResponder()
  }
}
