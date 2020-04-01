//
//  CartViewController.swift
//  AzureOverall
//
//  Created by Ian Cervone on 3/27/20.
//  Copyright © 2020 Ian Cervone. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

  lazy var cartView: CartView = {
    let cart = CartView()
    cart.cartTableView.delegate = self
    cart.cartTableView.dataSource = self
    return cart
  }()
  
  
    override func viewDidLoad() {
      super.viewDidLoad()
      view.addSubview(cartView)
    }
    


}


extension CartViewController: UITableViewDelegate {
  
}

extension CartViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.cartTableViewCell.rawValue, for: indexPath) as! CartTableViewCell
    return cell
  }
  
  
}
