//
//  Cars.swift
//  DisplayCars
//
//  Created by Balaji Peddaiahgari on 7/28/19.
//  Copyright © 2019 Balaji Peddaiahgari. All rights reserved.
//

import Foundation

struct Car: Codable {
    let year: Int
    let make: String
    let model: String
    let trim: String
    let price: Int
    let mileage: Int
    let dealer: Dealer
    let carImages: CarImages?
    
    enum CarCodingKeys : String, CodingKey {
        case year
        case make
        case model
        case trim
        case price = "currentPrice"
        case mileage
        case dealer
        case carImages = "images"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CarCodingKeys.self)
        year = try container.decode(Int.self, forKey: .year)
        make = try container.decode(String.self, forKey: .make)
        model = try container.decode(String.self, forKey: .model)
        trim = try container.decode(String.self, forKey: .trim)
        price = try container.decode(Int.self, forKey: .price)
        mileage = try container.decode(Int.self, forKey: .mileage)
        dealer = try container.decode(Dealer.self, forKey: .dealer)
        carImages = try container.decodeIfPresent(CarImages.self, forKey: .carImages)
    }
}
