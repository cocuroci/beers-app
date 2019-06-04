//
//  Beer.swift
//  Domain
//
//  Created by Andre Cocuroci on 04/06/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import Foundation

public struct Beer: Decodable {
  
  public let id: Int
  public let name: String
  public let tagline: String
  public let imageURL: URL?
  public let abv: Double
  public let ibu: Double?
  public let description: String
  
  private enum CodingKeys: String, CodingKey {
    case id, name, tagline, abv, ibu, description
    case imageURL = "image_url"
  }
}
