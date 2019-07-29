//
//  Dealer.swift
//  DisplayCars
//
//  Created by Balaji Peddaiahgari on 7/28/19.
//  Copyright © 2019 Balaji Peddaiahgari. All rights reserved.
//

import Foundation

struct Dealer: Codable {
    let city: String
    let state: String
    let phone: String
    
    enum DealerCodingKeys: String, CodingKey {
        case city
        case state
        case phone
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DealerCodingKeys.self)
        city = try container.decode(String.self, forKey: .city)
        state = try container.decode(String.self, forKey: .state)
        phone = try container.decode(String.self, forKey: .phone)
    }
}

struct CarImages: Codable {
    let mediumSizeImageArray: [URL]?
    
    enum CarImagesKeys: String, CodingKey {
        case mediumSizeImageArray = "medium"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CarImagesKeys.self)
        mediumSizeImageArray = try container.decodeIfPresent([URL].self, forKey: .mediumSizeImageArray)
    }
}
