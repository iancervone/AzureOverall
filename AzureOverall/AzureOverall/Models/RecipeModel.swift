//
//  RecipeModel.swift
//  AzureOverall
//
//  Created by Ian Cervone on 3/27/20.
//  Copyright © 2020 Ian Cervone. All rights reserved.
//

import Foundation

struct Recipe: Codable {
  let id: Int
  let title: String
  let readyInMinutes: Int
  let servings: Int
  let image: String
}
