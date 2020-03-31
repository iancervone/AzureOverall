//
//  SpoonacularAPIClient.swift
//  AzureOverall
//
//  Created by Ian Cervone on 3/27/20.
//  Copyright © 2020 Ian Cervone. All rights reserved.
//



import Foundation

struct SpoonacularAPIClient {

  static let manager = SpoonacularAPIClient()
  
  func getRecipes(from search: String, completionHandler: @escaping (Result<AllRecipes, AppError>) -> Void) {
    // what we want to return as a result is an array of dataWrapper ^^^ because the info we need is that array of each set of info on the weather for that day
     let recipeURL = "https://api.spoonacular.com/recipes/search?query=\(search)&number=2&apiKey=4393c4b9c3654e31b84f23fd34566150"
     guard let url = URL(string: recipeURL) else {
       completionHandler(.failure(.badURL))
       return
     }
     NetworkHelper.manager.getData(from: url) { result in
       switch result {
       case .failure(let error) :
         completionHandler(.failure(error))
       case .success(let data):
         do {
          let recipeInfo = try JSONDecoder().decode(AllRecipes.self, from: data)
          //what we decode is a Forecast, not an array of dataWrapper ^^^ because we always decode from the highest level of the model
          completionHandler(.success(recipeInfo))
         } catch {
           completionHandler(.failure(.couldNotParseJSON(rawError: error)))
         }
       }
     }
   }

  private init() {}
}


