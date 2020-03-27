//
//  AppError.swift
//  AzureOverall
//
//  Created by Ian Cervone on 3/27/20.
//  Copyright © 2020 Ian Cervone. All rights reserved.
//

import Foundation

enum AppError: Error {
  case unauthenticated
  case invalidJSONResponse
  case couldNotParseJSON(rawError: Error)
  case noInternetConnection
  case badURL
  case badStatusCode
  case noDataReceived
  case notAnImage
  case other(rawError: Error)
  case badImageData

}
