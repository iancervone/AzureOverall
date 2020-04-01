//
//  RecipeDetailViewController.swift
//  AzureOverall
//
//  Created by Ian Cervone on 3/27/20.
//  Copyright © 2020 Ian Cervone. All rights reserved.
//

import UIKit
import CoreData
class RecipeDetailViewController: UIViewController {
  
//MARK: Variables
    var cartArray = [CartItem]()
  
    var recipeDetails: Recipe!
  
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
//    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("CartItems.plist")
  
    var cartCounter = Double(0) {
      didSet {
        detailViews.counterLabel.text = String(" \(Int(cartCounter))")
//        detailViews.counterLabel.reloadInputViews()
//        print(cartCounter)
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
      detail.counterLabel.text = String(" \(Int(cartCounter))")
      detail.recipeImage.image = detailImage
      detail.cartCountStepper.value = cartCounter
      detail.cartCountStepper.addTarget(self, action: #selector(stepperPressed), for: .touchUpInside)
      return detail
    }()

//MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCartRecipes()
        getRecipeImage()
        view.addSubview(detailViews)
        view.backgroundColor = .systemBackground
        print(cartArray.count)
    }
  
    override func viewWillDisappear(_ animated: Bool) {
      saveToCore()
    }
  
//MARK: Functions
  private func loadCartRecipes() {
    let request : NSFetchRequest<CartItem> = CartItem.fetchRequest()
    do {
    cartArray = try context.fetch(request)
      for item in cartArray {
      if recipeDetails.title == item.title {
        cartCounter = item.count
        }
      }
    } catch {
      print(error)
    }
  }
  
//  private func saveRecipesToCart() {
//    for item in cartArray {
//      if recipeDetails.title == item.title {
//        cartArray.remove(at: index(ofAccessibilityElement: item))
//        cartCounter = item.count
//      }
//    do {
//      try context.save()
//    } catch {
//        print(error)
//    }
//  }
//  }
  
  
  func saveToCore() {
    for item in cartArray {
    var itemIndex = 0
    if recipeDetails.title != item.title {
      itemIndex += 1
    } else {
      cartArray.remove(at: itemIndex)
      context.delete(cartArray[itemIndex])
      continue
      }
    }
    let newItem = CartItem(context: self.context)
    newItem.title = recipeDetails.title
    newItem.imageURL = recipeDetails.imageUrls[0]
    newItem.count = cartCounter
    self.cartArray.append(newItem)
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

//MARK: OBJC Functions
  @objc func stepperPressed() {
    cartCounter = detailViews.cartCountStepper.value
    detailViews.counterLabel.text = String(" \(Int(cartCounter))")
  }

}
