//
//  Beer.swift
//  Beers
//
//  Created by Andre Cocuroci on 31/05/19.
//  Copyright © 2019 Andre Cocuroci. All rights reserved.
//

import Foundation

struct Beer: Decodable {
  let id: Int
  let name: String
  let tagline: String
  let imageURL: URL
  let abv: Double
  let ibu: Double?
  let description: String
  
  private enum CodingKeys: String, CodingKey {
    case id, name, tagline, abv, ibu, description
    case imageURL = "image_url"
  }
}
