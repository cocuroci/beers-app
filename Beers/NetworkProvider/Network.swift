//
//  Network.swift
//  Network
//
//  Created by Andre Cocuroci on 04/06/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import Foundation

protocol Networking {
  func request(routing: Routing, onComplete: @escaping (Result<Data, Error>) -> Void)
}

final class Network: Networking {
  
  let session: URLSession
  
  init(session: URLSession = URLSession(configuration: .default)) {
    self.session = session
  }
  
  func request(routing: Routing, onComplete: @escaping (Result<Data, Error>) -> Void) {
    let url = routing.baseURL.appendingPathComponent(routing.path)
    var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: false)
    
    urlComponent?.queryItems = routing.parameters.map { name, value in
      return URLQueryItem(name: name, value: value)
    }
    
    guard let component = urlComponent, let completURL = component.url else {
      onComplete(Result.failure(URLError.parseURL))
      return
    }
    
    var urlRequest = URLRequest(url: completURL, cachePolicy: .reloadIgnoringCacheData)
    urlRequest.httpMethod = routing.method
    
    let task = session.dataTask(with: urlRequest) { data, response, error in
      if let error = error {
        onComplete(Result.failure(error))
      }
      
      if let data = data {
        let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
        
        switch statusCode {
        case 200..<300:
          onComplete(Result.success(data))
        default:
          onComplete(Result.failure(APIError.requestError))
        }
      }
    }
    
    task.resume()
  }
}
