//
//  RecipeDetailViewController.swift
//  AzureOverall
//
//  Created by Ian Cervone on 3/27/20.
//  Copyright © 2020 Ian Cervone. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
  
    var recipeDetails: Recipe!
  
    var cartCounter = Int(0) {
      didSet {
        detailViews.counterLabel.text = String(" \(cartCounter)")
      }
    }
  
  var detailImage = UIImage() {
    didSet {
      detailViews.recipeImage.image = detailImage
    }
  }
  
    
  //MARK: UI Elements
    
    lazy var detailViews: DetailView = {
      let detail = DetailView()
      detail.recipeNameLabel.text = recipeDetails.title
      detail.servingsLabel.text = String("Servings: \(recipeDetails.servings)")
      detail.timeLabel.text = String("Cook Time: \(recipeDetails.readyInMinutes) min")
      detail.counterLabel.text = String(" \(cartCounter)")
      detail.recipeImage.image = detailImage
      return detail
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
      getRecipeImage()
      view.addSubview(detailViews)
      view.backgroundColor = .systemBackground
    }
    
  
  
  func getRecipeImage() {
    let url = "https://spoonacular.com/recipeImages/\(recipeDetails.imageUrls[0])"
  ImageHelper.shared.getImage(urlStr: url) {(result) in
    DispatchQueue.main.async {
      switch result {
      case .failure (let error):
        print(url)
        print("oh no \(error)")
      case .success (let image):
        self.detailImage = image
      }
    }
  }
  }

}
