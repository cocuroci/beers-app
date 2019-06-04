//
//  Router.swift
//  Network
//
//  Created by Andre Cocuroci on 04/06/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import Foundation

protocol Routing {
  var baseURL: URL { get }
  var path: String { get }
  var method: String { get }
  var parameters: [String: String] { get }
}

enum Router {
  case list(page: Int)
}

extension Router: Routing {
  var baseURL: URL {
    return URL(string: "https://api.punkapi.com/v2")!
  }
  
  var path: String {
    switch self {
    case .list:
      return "beers"
    }
  }
  
  var method: String {
    switch self {
    case .list:
      return "GET"
    }
  }
  
  var parameters: [String : String] {
    switch self {
    case .list(let page):
      return ["page": "\(page)"]
    }
  }
}
