//
//  CartViewController.swift
//  AzureOverall
//
//  Created by Ian Cervone on 3/27/20.
//  Copyright © 2020 Ian Cervone. All rights reserved.
//

import UIKit
import CoreData

class CartViewController: UIViewController {
  
//MARK: Variables
  var cartArray = [CartItem]()
  
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

  
//MARK: UI Elements
    lazy var cartView: CartView = {
      let cart = CartView()
      cart.cartTableView.delegate = self
      cart.cartTableView.dataSource = self
      return cart
    }()
  
//MARK: Lifecycle
    override func viewDidLoad() {
      super.viewDidLoad()
      loadCartRecipes()
      view.addSubview(cartView)
    }
    
//MARK: Functions
   private func loadCartRecipes() {
      let request : NSFetchRequest<CartItem> = CartItem.fetchRequest()
      do {
      cartArray = try context.fetch(request)
      } catch {
        print(error)
      }
    }

}



//MARK: Extenstions
extension CartViewController: UITableViewDelegate {
  
}

extension CartViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cartArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.cartTableViewCell.rawValue, for: indexPath) as! CartTableViewCell
    cell.recipeNameLabel.text = cartArray[indexPath.row].title
    cell.counterLabel.text = String("\(Int(cartArray[indexPath.row].count))")
    guard let url = "https://spoonacular.com/recipeImages/\(cartArray[indexPath.row].imageURL)" as? String else { return cell}
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
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let cellSize = CGFloat(signOf: (view.frame.width), magnitudeOf: (view.frame.width) * 0.15)
    return cellSize
  }
  
}
